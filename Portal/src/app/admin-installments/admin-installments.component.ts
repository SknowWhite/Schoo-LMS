import { ChangeDetectorRef, Component, Injector, OnInit } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import {
  FormGroup,
  FormBuilder,
  Validators,
  FormArray,
} from "@node_modules/@angular/forms";
import {
  GetInstallmentsInput,
  InstallmentDto,
  InstallmentService,
  StudentImportServiceProxy,
} from "@shared/service-proxies/service-proxies";
import { AppComponentBase } from "@shared/app-component-base";
import { BsModalRef, BsModalService } from "ngx-bootstrap/modal";
import { ViewChild, TemplateRef } from "@angular/core";

interface InstallmentBreakdown {
  label: string;
  amount: number;
}

interface InstallmentTemplate {
  id?: string;
  name: string;
  type: number;
  totalAmount: number;
  startDate: string;
  endDate: string;
  notes?: string;
  breakdowns: InstallmentBreakdown[];
}
@Component({
  selector: "app-admin-installments",
  templateUrl: "./admin-installments.component.html",
  styleUrls: ["./admin-installments.component.css"],
})
export class AdminInstallmentsComponent
  extends AppComponentBase
  implements OnInit
{
  form: FormGroup;
  templates: any[] = [];
  page = 1;
  isEditMode = false;
  selectedTemplateId: string | null = null;
  templateIdToAssign: string;
  selectedGrade: string;
  students: any[] = []; // fetched from backend
  assignmentTargets: { [templateId: string]: string } = {};
  grades: string[] = [];
  assigningIds: string[] = [];
  studentOptions: any[] = [];
  customStudents: { [templateId: string]: any[] } = {};
  uploadSummary: any;

  dropdownConfig = {
    displayKey: "name", // shown on dropdown
    search: true,
    height: "250px",
    placeholder: "Select Students",
    customComparator: undefined,
    limitTo: 0,
    moreText: "more",
    noResultsFound: "No results found!",
    searchPlaceholder: "Search...",
    searchOnKey: "name",
    clearOnSelection: false,
    inputDirection: "ltr",
    selectAllLabel: "Select All",
    enableSelectAll: true,
  };

  constructor(
    injector: Injector,
    private cdr: ChangeDetectorRef,
    private fb: FormBuilder,
    private installmentService: InstallmentService,
    private studentService: StudentImportServiceProxy,
    private modalService: BsModalService
  ) {
    super(injector);
    this.form = this.fb.group({
      name: ["", Validators.required],
      type: [0, Validators.required],
      totalAmount: [0, Validators.required],
      startDate: ["", Validators.required],
      endDate: ["", Validators.required],
      notes: [""],
      breakdowns: this.fb.array([]),
    });
  }
  ngOnInit(): void {
    this.getTemplates();
    this.getGrades();
  }

  get breakdowns(): FormArray {
    return this.form.get("breakdowns") as FormArray;
  }

  addBreakdown(): void {
    this.breakdowns.push(this.fb.group({ label: [""], amount: [0] }));
  }

  removeBreakdown(index: number): void {
    this.breakdowns.removeAt(index);
  }

  getTemplates(): void {
    this.installmentService.getTemplates().subscribe((res: any) => {
      this.templates = res.result;
      this.cdr.detectChanges();
      console.log("Templates fetched:", res.result);
    });
  }

  submit(): void {
    const dto = this.form.value;
    if (this.isEditMode && this.selectedTemplateId) {
      this.installmentService
        .updateTemplate(this.selectedTemplateId, dto)
        .subscribe(() => {
          this.resetForm();
          this.getTemplates();
        });
    } else {
      this.installmentService.createTemplate(dto).subscribe(() => {
        this.resetForm();
        this.getTemplates();
      });
    }
  }

  edit(template: any): void {
    this.isEditMode = true;
    this.selectedTemplateId = template.id;
    this.form.patchValue({
      ...template,
      startDate: template.startDate?.slice(0, 10),
      endDate: template.endDate?.slice(0, 10),
    });

    this.breakdowns.clear();
    template.breakdowns.forEach((b: any) =>
      this.breakdowns.push(
        this.fb.group({ label: [b.label], amount: [b.amount] })
      )
    );
  }

  assignToAll(templateId: string): void {
    this.installmentService.assignToAllStudents(templateId).subscribe(() => {
      alert("Assigned to all students!");
    });
  }

  resetForm(): void {
    this.form.reset();
    this.breakdowns.clear();
    this.page = 1;
    this.isEditMode = false;
    this.selectedTemplateId = null;
  }

  getGrades(): void {
    this.installmentService.getAllGrades().subscribe((res: any) => {
      this.grades = res.result || res.items || [];
    });
  }

  assignTemplate(templateId: string): void {
    const target = this.assignmentTargets[templateId] || "all";
    this.assigningIds.push(templateId);

    const complete = () => {
      this.assigningIds = this.assigningIds.filter((id) => id !== templateId);
    };

    if (target === "all") {
      this.installmentService.assignToAllStudents(templateId).subscribe({
        next: () => this.notify.success("Assigned to all students"),
        error: () => this.notify.error("Assignment failed"),
        complete,
      });
    } else {
      this.installmentService.assignToGrade(target, templateId).subscribe({
        next: () => this.notify.success(`Assigned to grade ${target}`),
        error: () => this.notify.error("Assignment failed"),
        complete,
      });
    }
  }
  deleteTemplate(id: string): void {
    if (!confirm("Are you sure you want to delete this template?")) return;

    this.installmentService.deleteTemplate(id).subscribe({
      next: () => {
        this.notify.success("Template deleted");
        this.getTemplates();
      },
      error: () => this.notify.error("Failed to delete"),
    });
  }
  isCreateDisabled(): boolean {
    const name = this.form.get("name")?.value?.trim();
    const endDate = new Date(this.form.get("endDate")?.value);
    const amount = this.form.get("totalAmount")?.value;

    const isNameEmpty = !name;
    const isEndDateInPast = isNaN(endDate.getTime()) || endDate < new Date();
    const isAmountInvalid = amount == null || amount <= 0;

    return isNameEmpty || isEndDateInPast || isAmountInvalid;
  }

  uploadExcel(event: any): void {
    const file = event.target.files[0];
    if (!file) return;

    const formData = new FormData();
    formData.append("file", file);

    this.installmentService.uploadTemplateExcel(formData).subscribe({
      next: (res) => {
        this.uploadSummary = res;
        this.notify.success(`Processed: ${res.successCount} rows`);
        this.getTemplates();
      },
      error: () => this.notify.error("Upload failed"),
    });
  }

  downloadExcelTemplate(): void {
    this.installmentService.downloadExcelTemplate().subscribe((blob) => {
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = "StudentInstallmentsTemplate.xlsx";
      a.click();
      URL.revokeObjectURL(url);
    });
  }
}
