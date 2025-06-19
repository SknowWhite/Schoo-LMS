
  
  export interface Installment {
    amount: number;
    dueDate: Date;
  }
  
  export interface EducationalFeeDTO {
    id: number;
    grade: string;
    expectedAmount: number;
    firstInstallment: Installment;
    secondInstallment: Installment;
    thirdInstallment: Installment;
    fourthInstallment: Installment;
    fullAmountWithDiscount: Installment;
  }
  
  export interface BusFeeDTO {
    id: number;
    line: string;
    expectedAmount: number;
    firstInstallment: Installment;
    secondInstallment: Installment;
    thirdInstallment: Installment;
    fourthInstallment: Installment;
    fullAmountWithDiscount: Installment;
  }
  