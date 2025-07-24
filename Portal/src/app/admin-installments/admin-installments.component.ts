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
  assignmentType: "all" | "grade" | "selected" = "all";
  grades: string[] = ["Prim 1", "Prim 2", "Prim 3"];
  selectedGrade: string;
  students: any[] = []; // fetched from backend
  showAssignSection = false;

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

  confirmAssignment(): void {
    if (!this.templateIdToAssign) return;

    if (this.assignmentType === "all") {
      this.installmentService
        .assignToAllStudents(this.templateIdToAssign)
        .subscribe(() => {
          this.notify.success("Assigned to all students");
          this.showAssignSection = false;
        });
    } else if (this.assignmentType === "grade") {
      this.installmentService
        .assignToGrade(this.selectedGrade, this.templateIdToAssign)
        .subscribe(() => {
          this.notify.success(`Assigned to grade ${this.selectedGrade}`);
          this.showAssignSection = false;
        });
    } else if (this.assignmentType === "selected") {
      const selectedIds = this.students
        .filter((s) => s.selected)
        .map((s) => s.id);
      this.installmentService
        .assignToStudents(selectedIds, this.templateIdToAssign)
        .subscribe(() => {
          this.notify.success("Assigned to selected students");
          this.showAssignSection = false;
        });
    }
  }

  cancelAssign(): void {
    this.templateIdToAssign = null;
    this.showAssignSection = false;
  }

  openAssignSection(templateId: string): void {
    this.templateIdToAssign = templateId;
    this.assignmentType = "all";
    this.showAssignSection = true;

    this.studentService.getAll("", 0, 100000).subscribe((res) => {
      this.students = res.items.map((s) => ({ ...s, selected: false }));
    });
  }
}
