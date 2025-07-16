import * as XLSX from "xlsx";
import { ChangeDetectorRef, Component, Injector, OnInit } from "@angular/core";
import { AppComponentBase } from "@shared/app-component-base";
import { appModuleAnimation } from "@shared/animations/routerTransition";
import { finalize } from "rxjs/operators";
import { EducationalFeeDTO, BusFeeDTO } from "@shared/models/exportsModesl";
import {
  PagedListingComponentBase,
  PagedRequestDto,
} from "@shared/paged-listing-component-base";
import {
  CreateStudentDTO,
  StudentImportServiceProxy,
  StudentDTO,
  IStudentDto,
} from "@shared/service-proxies/service-proxies";

@Component({
  selector: "app-student-component",
  templateUrl: "./students.component.html",
  styleUrls: ["./students.component.css"],
  animations: [appModuleAnimation()],
})
export class StudentsComponent extends AppComponentBase implements OnInit {
  keyword = "";
  isLoading = false;

  // Data arrays for each sheet
  studentsData: IStudentDto[] = [];
  educationalFeesData: EducationalFeeDTO[] = [];
  busFeesData: BusFeeDTO[] = [];

  // Track which tabs are visible based on data
  hasStudentsData = false;
  hasEducationalFeesData = false;
  hasBusFeesData = false;

  // Track which tab is active
  activeTab = "students";

  // For validation errors
  validationErrors: string[] = [];
  hasValidationErrors = false;

  constructor(
    private cdr: ChangeDetectorRef,
    injector: Injector,
    private _importService: StudentImportServiceProxy
  ) {
    super(injector);
  }

  ngOnInit(): void {
    this.getStudents();
    this.getEducationalFees();
    this.getBusFees();
  }

  onFileChange(event: any): void {
    const file = event.target.files[0];

    this.isLoading = true;
    this.validationErrors = [];
    this.hasValidationErrors = false;

    if (!file) {
      this.isLoading = false;
      return;
    }

    // Reset data
    this.studentsData = [];
    this.educationalFeesData = [];
    this.busFeesData = [];
    this.hasStudentsData = false;
    this.hasEducationalFeesData = false;
    this.hasBusFeesData = false;

    const target: DataTransfer = <DataTransfer>event.target;

    if (target.files.length !== 1) {
      this.notify.error(this.l("PleaseSelectASingleExcelFile"));
      this.isLoading = false;
      return;
    }

    const reader: FileReader = new FileReader();
    reader.onload = (e: any) => {
      try {
        const binaryString: string = e.target.result;
        const workBook: XLSX.WorkBook = XLSX.read(binaryString, {
          type: "binary",
        });

        // Get all sheet names
        const sheetNames = workBook.SheetNames;

        // Process Students sheet (STD)
        if (sheetNames.includes("STD")) {
          const studentsSheet = workBook.Sheets["STD"];
          const rawStudentsData = XLSX.utils.sheet_to_json(studentsSheet, {
            defval: "",
          });
          if (rawStudentsData.length > 0) {
            this.processStudentsData(rawStudentsData);
            this.hasStudentsData = this.studentsData.length > 0;
            // Set students as default active tab if data exists
            if (this.hasStudentsData && !this.activeTab) {
              this.activeTab = "students";
            }
          }
        } else {
          this.validationErrors.push(this.l("SheetNotFound", "STD"));
        }

        // Process Educational Fees sheet
        if (sheetNames.includes("Educational Fees")) {
          const educationalFeesSheet = workBook.Sheets["Educational Fees"];
          const rawEducationalFeesData = XLSX.utils.sheet_to_json(
            educationalFeesSheet,
            { defval: "" }
          );
          if (rawEducationalFeesData.length > 0) {
            this.processEducationalFeesData(rawEducationalFeesData);
            this.hasEducationalFeesData = this.educationalFeesData.length > 0;
            // Set educational fees as active tab if it has data and students doesn't
            if (
              this.hasEducationalFeesData &&
              !this.hasStudentsData &&
              !this.activeTab
            ) {
              this.activeTab = "educationalFees";
            }
          }
        } else {
          this.validationErrors.push(
            this.l("SheetNotFound", "Educational Fees")
          );
        }

        // Process Bus Fees sheet
        if (sheetNames.includes("Bus Fees")) {
          const busFeesSheet = workBook.Sheets["Bus Fees"];
          const rawBusFeesData = XLSX.utils.sheet_to_json(busFeesSheet, {
            defval: "",
          });
          if (rawBusFeesData.length > 0) {
            this.processBusFeesData(rawBusFeesData);
            this.hasBusFeesData = this.busFeesData.length > 0;
            // Set bus fees as active tab if it has data and others don't
            if (
              this.hasBusFeesData &&
              !this.hasStudentsData &&
              !this.hasEducationalFeesData &&
              !this.activeTab
            ) {
              this.activeTab = "busFees";
            }
          }
        } else {
          this.validationErrors.push(this.l("SheetNotFound", "Bus Fees"));
        }
        // If no sheets found with data, show error
        if (
          !this.hasStudentsData &&
          !this.hasEducationalFeesData &&
          !this.hasBusFeesData
        ) {
          this.notify.warn(this.l("NoDataFoundInSpreadsheet"));
        }

        this.hasValidationErrors = this.validationErrors.length > 0;
        this.isLoading = false;
      } catch (error) {
        console.error("Error processing Excel file:", error);
        this.notify.error(this.l("ErrorProcessingExcelFile"));
        this.validationErrors.push(this.l("InvalidExcelFormat"));
        this.hasValidationErrors = true;
      } finally {
        this.cdr.detectChanges(); // 👈 this forces Angular to update the UI
        this.isLoading = false;
      }
    };

    reader.onerror = (e) => {
      this.notify.error(this.l("ErrorReadingFile"));
      this.isLoading = false;
    };

    reader.readAsBinaryString(target.files[0]);
  }

  processStudentsData(rawData: any[]): void {
    // Define required columns
    const requiredColumns = [
      "Name",
      "Grade",
      "Previous Amount",
      "Mobile Number",
      "Status_Des",
      "id",
    ];

    // Check if all required columns exist
    this.checkRequiredColumns(rawData, requiredColumns, "STD");

    // Transform raw data to match our model
    this.studentsData = rawData.map((item: any, index: number) => {
      const student: IStudentDto = {
        id: 0,
        studentId: this.getStringValue(item, "id"),

        name: this.getStringValue(item, "Name"),
        grade: this.getStringValue(item, "Grade"),
        previousAmount: this.getNumberValue(item, "Previous Amount"),
        mobileNumber: this.getStringValue(item, "Mobile Number"),
        status: this.getStringValue(item, "Status_Des"),
      };

      // Validate student data
      this.validateStudentData(student, index);

      return student;
    });
  }

  processEducationalFeesData(rawData: any[]): void {
    // Define required columns
    const requiredColumns = [
      "Grade",
      "Expected Amount",
      "First Installment Before 1-6",
      "Second Installment Before 1-8",
      "Third Installment Before 1-10",
      "Fourth Installment Before 1-12",
      "Full Amount Before 1-6",
    ];

    // Check if all required columns exist
    this.checkRequiredColumns(rawData, requiredColumns, "Educational Fees");

    // Transform raw data to match our model
    this.educationalFeesData = rawData.map((item: any, index: number) => {
      const educationalFee: EducationalFeeDTO = {
        id: 0,
        grade: this.getStringValue(item, "Grade"),
        expectedAmount: this.getNumberValue(item, "Expected Amount"),
        firstInstallment: {
          amount: this.getNumberValue(item, "First Installment Before 1-6"),
          dueDate: new Date(2025, 5, 1), // June 1, 2025
        },
        secondInstallment: {
          amount: this.getNumberValue(item, "Second Installment Before 1-8"),
          dueDate: new Date(2025, 7, 1), // August 1, 2025
        },
        thirdInstallment: {
          amount: this.getNumberValue(item, "Third Installment Before 1-10"),
          dueDate: new Date(2025, 9, 1), // October 1, 2025
        },
        fourthInstallment: {
          amount: this.getNumberValue(item, "Fourth Installment Before 1-12"),
          dueDate: new Date(2025, 11, 1), // December 1, 2025
        },
        fullAmountWithDiscount: {
          amount: this.getNumberValue(item, "Full Amount Before 1-6"),
          dueDate: new Date(2025, 5, 1), // June 1, 2025
        },
      };

      // Validate educational fee data
      this.validateEducationalFeeData(educationalFee, index);

      return educationalFee;
    });
  }

  processBusFeesData(rawData: any[]): void {
    // Define required columns
    const requiredColumns = [
      "Lines",
      "Expected Amount",
      "First Installment Before 1-6",
      "Second Installment Before 1-8",
      "Third Installment Before 1-10",
      "Fourth Installment Before 1-12",
      "Full Amount Before 1-6",
    ];

    // Check if all required columns exist
    this.checkRequiredColumns(rawData, requiredColumns, "Bus Fees");

    // Transform raw data to match our model
    this.busFeesData = rawData.map((item: any, index: number) => {
      const busFee: BusFeeDTO = {
        id: 0,
        line: this.getStringValue(item, "Lines"),
        expectedAmount: this.getNumberValue(item, "Expected Amount"),
        firstInstallment: {
          amount: this.getNumberValue(item, "First Installment Before 1-6"),
          dueDate: new Date(2025, 5, 1), // June 1, 2025
        },
        secondInstallment: {
          amount: this.getNumberValue(item, "Second Installment Before 1-8"),
          dueDate: new Date(2025, 7, 1), // August 1, 2025
        },
        thirdInstallment: {
          amount: this.getNumberValue(item, "Third Installment Before 1-10"),
          dueDate: new Date(2025, 9, 1), // October 1, 2025
        },
        fourthInstallment: {
          amount: this.getNumberValue(item, "Fourth Installment Before 1-12"),
          dueDate: new Date(2025, 11, 1), // December 1, 2025
        },
        fullAmountWithDiscount: {
          amount: this.getNumberValue(item, "Full Amount Before 1-6"),
          dueDate: new Date(2025, 5, 1), // June 1, 2025
        },
      };

      // Validate bus fee data
      this.validateBusFeeData(busFee, index);

      return busFee;
    });
  }

  validateStudentData(student: CreateStudentDTO, index: number): void {
    if (!student.name) {
      this.validationErrors.push(this.l("StudentNameRequired", index + 1));
    }
    if (!student.grade) {
      this.validationErrors.push(this.l("StudentGradeRequired", index + 1));
    }
    if (!student.mobileNumber) {
      this.validationErrors.push(this.l("MobileNumberRequired", index + 1));
    } else if (!/^\d{11}$/.test(student.mobileNumber)) {
      this.validationErrors.push(this.l("InvalidMobileNumber", index + 1));
    }
  }

  validateEducationalFeeData(fee: EducationalFeeDTO, index: number): void {
    if (!fee.grade) {
      this.validationErrors.push(this.l("GradeRequired", index + 1));
    }
    if (fee.expectedAmount <= 0) {
      this.validationErrors.push(
        this.l("InvalidExpectedAmount", "Educational Fee", index + 1)
      );
    }

    // Validate installment amounts
    if (fee.firstInstallment.amount < 0) {
      this.validationErrors.push(
        this.l(
          "InvalidInstallmentAmount",
          "First",
          "Educational Fee",
          index + 1
        )
      );
    }
    if (fee.secondInstallment.amount < 0) {
      this.validationErrors.push(
        this.l(
          "InvalidInstallmentAmount",
          "Second",
          "Educational Fee",
          index + 1
        )
      );
    }
    if (fee.thirdInstallment.amount < 0) {
      this.validationErrors.push(
        this.l(
          "InvalidInstallmentAmount",
          "Third",
          "Educational Fee",
          index + 1
        )
      );
    }
    if (fee.fourthInstallment.amount < 0) {
      this.validationErrors.push(
        this.l(
          "InvalidInstallmentAmount",
          "Fourth",
          "Educational Fee",
          index + 1
        )
      );
    }
    if (fee.fullAmountWithDiscount.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidFullAmountWithDiscount", "Educational Fee", index + 1)
      );
    }
  }

  validateBusFeeData(fee: BusFeeDTO, index: number): void {
    if (!fee.line) {
      this.validationErrors.push(this.l("LineRequired", index + 1));
    }
    if (fee.expectedAmount <= 0) {
      this.validationErrors.push(
        this.l("InvalidExpectedAmount", "Bus Fee", index + 1)
      );
    }

    // Validate installment amounts
    if (fee.firstInstallment.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidInstallmentAmount", "First", "Bus Fee", index + 1)
      );
    }
    if (fee.secondInstallment.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidInstallmentAmount", "Second", "Bus Fee", index + 1)
      );
    }
    if (fee.thirdInstallment.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidInstallmentAmount", "Third", "Bus Fee", index + 1)
      );
    }
    if (fee.fourthInstallment.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidInstallmentAmount", "Fourth", "Bus Fee", index + 1)
      );
    }
    if (fee.fullAmountWithDiscount.amount < 0) {
      this.validationErrors.push(
        this.l("InvalidFullAmountWithDiscount", "Bus Fee", index + 1)
      );
    }
  }

  // Helper methods for data extraction and validation

  checkRequiredColumns(
    data: any[],
    requiredColumns: string[],
    sheetName: string
  ): void {
    if (data.length === 0) {
      return;
    }

    const firstRow = data[0];
    for (const column of requiredColumns) {
      if (firstRow[column] === undefined) {
        this.validationErrors.push(
          this.l("ColumnNotFoundInSheet", column, sheetName)
        );
      }
    }
  }

  getStringValue(item: any, key: string): string {
    return item[key] ? String(item[key]).trim() : "";
  }

  getNumberValue(item: any, key: string): number {
    const value = item[key];
    if (value === undefined || value === "") {
      return 0;
    }
    const numValue = Number(value);
    return isNaN(numValue) ? 0 : numValue;
  }

  saveData(): void {
    if (this.hasValidationErrors) {
      this.message.warn(this.l("PleaseFixValidationErrorsBeforeSaving"));
      return;
    }

    this.isLoading = true;

    // Prepare data for backend
    const data = {
      students: this.studentsData,
      educationalFees: this.educationalFeesData,
      busFees: this.busFeesData,
    };

    // Simulate successful save for now

    this.isLoading = false;
    this.notify.success(this.l("DataProcessedSuccessfully"));

    this._importService
      .ImportEducationalFees(this.educationalFeesData)
      .subscribe((result) => {
        this.notify.success(this.l("DataSavedSuccessfully"));
      });
    this._importService.ImportBusFees(this.busFeesData).subscribe((result) => {
      this.notify.success(this.l("DataSavedSuccessfully"));
    });
    /*  */

    this._importService
      .ImportStudents(this.studentsData)
      .subscribe((result) => {
        this.notify.success(this.l("DataSavedSuccessfully"));
      });
  }

  handleError(error: any): void {
    if (error.error && error.error.error && error.error.error.message) {
      this.message.error(error.error.error.message);
    } else {
      this.message.error(this.l("ErrorSavingData"));
    }
  }

  setActiveTab(tabName: string): void {
    this.activeTab = tabName;
  }

  protected list(
    request: PagedRequestDto,
    pageNumber: number,
    finishedCallback: Function
  ): void {
    // request.keyword = this.keyword;
  }
  protected delete(entity: StudentDTO): void {
    throw new Error("Method not implemented.");
  }

  getStudents() {
    this._importService.getAll("", 0, 1000000).subscribe((data) => {
      this.studentsData = data.items;
      this.hasStudentsData = true;
      this.cdr.detectChanges();
    });
  }
  getEducationalFees() {
    this._importService
      .getAllEducationsFees("", 0, 1000000)
      .subscribe((data) => {
        this.educationalFeesData = data;
        this.hasEducationalFeesData = true;
        this.cdr.detectChanges();
      });
  }
  getBusFees() {
    this._importService.getAllBusFees("", 0, 1000000).subscribe((data) => {
      this.busFeesData = data;
      this.hasBusFeesData = true;
      console.log(this.busFeesData);
      this.cdr.detectChanges();
    });
  }
}
