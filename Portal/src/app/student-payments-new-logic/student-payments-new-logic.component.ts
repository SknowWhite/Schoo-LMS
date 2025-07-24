import { ChangeDetectorRef, Component, Injector, OnInit } from "@angular/core";
import { AppComponentBase } from "@shared/app-component-base";
import {
  EducationalPaymentServiceProxy,
  StudentPaymentService,
} from "@shared/service-proxies/service-proxies";

@Component({
  selector: "app-student-payments-new-logic",
  templateUrl: "./student-payments-new-logic.component.html",
  styleUrl: "./student-payments-new-logic.component.css",
})
export class StudentPaymentsNewLogicComponent
  extends AppComponentBase
  implements OnInit
{
  constructor(
    injector: Injector,
    private cdr: ChangeDetectorRef,
    private paymentService: StudentPaymentService,
    private _studentService: EducationalPaymentServiceProxy
  ) {
    super(injector);
  }
  studentInstallments: any[] = [];
  isAdmin = false; // toggle depending on route/claim
  isStudent: boolean = false;
  studentId: number = 0; // Replace with actual user context
  filters = {
    student: "",
    template: "",
    status: "",
  };
  ngOnInit(): void {
    // check from service or token if admin
    this.isAdmin = this.hasRole("Admin"); // placeholder
    this.isStudent = this.hasRole("Student"); // placeholder
    if (this.isStudent) {
      this._studentService
        .getStudentByName(this.appSession.getShownLoginName())
        .subscribe((data: any) => {
          this.studentId = data.studentId;
          this.loadInstallments();
        });
    } else {
      this.studentId = 0; // Reset or set to a default value
      this.loadInstallments();
    }
  }
  loadInstallments(): void {
    if (this.isAdmin) {
      this.paymentService.getAllInstallments().subscribe((res: any) => {
        this.studentInstallments = res.result;
        console.log("Installments loaded:", this.studentInstallments);
        this.cdr.detectChanges(); // Ensure view updates
      });
    } else {
      this.paymentService
        .getValidInstallments(this.studentId)
        .subscribe((res: any) => {
          this.studentInstallments = res.result;
          this.cdr.detectChanges(); // Ensure view updates
        });
    }
  }
  filteredInstallments(): any[] {
    return this.studentInstallments.filter((i) => {
      const matchStudent =
        !this.filters.student ||
        i.student?.name
          ?.toLowerCase()
          .includes(this.filters.student.toLowerCase());
      const matchTemplate =
        !this.filters.template ||
        i.installmentTemplate?.name
          ?.toLowerCase()
          .includes(this.filters.template.toLowerCase());
      const matchStatus =
        this.filters.status === "" || i.status === +this.filters.status;

      return matchStudent && matchTemplate && matchStatus;
    });
  }
  saveChanges(item: any): void {
    this.paymentService
      .updateAdmin(item.id, item.amount, item.dueDate)
      .subscribe(() => {
        alert("Updated successfully");
        this.loadInstallments(); // Refresh the list after update
      });
  }
  generateInvoice(item: any): void {
    this.paymentService.generateInvoice(item.id).subscribe(() => {
      alert("Invoice generated successfully");
      this.loadInstallments(); // Refresh the list after generating invoice
    });
  }

  getStatusLabel(status: number): string {
    switch (status) {
      case 0:
        return "New";
      case 1:
        return "Pending";
      case 2:
        return "Paid";
      case 3:
        return "Failed";
      default:
        return "Unknown";
    }
  }
  hasRole(role: string): boolean {
    return this.appSession.userRoles?.includes(role);
  }
  isInstallementOverdue(dueDate: any): boolean {
    return new Date(dueDate) < new Date();
  }
}
