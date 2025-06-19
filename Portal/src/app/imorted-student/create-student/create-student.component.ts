import {
  Component,
  Injector,
  OnInit,
  Output,
  EventEmitter,
  ChangeDetectorRef
} from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { AppComponentBase } from '@shared/app-component-base';
import {
  CreateStudentDTO,
  StudentImportServiceProxy
} from '@shared/service-proxies/service-proxies';
import { appModuleAnimation } from '@shared/animations/routerTransition';



@Component({
  selector: 'app-create-student',
  templateUrl: './create-student.component.html',
  styleUrl: './create-student.component.css',
  animations: [appModuleAnimation()]

})
export class CreateStudentComponent extends AppComponentBase implements OnInit {

  saving = false;
  student: CreateStudentDTO ={
    name: '',
    studentId:'',
    grade: '',
    mobileNumber: '',
    status: '',
    previousAmount: 0
  };

  @Output() onSave = new EventEmitter<any>();
  
  constructor(
    injector: Injector,
    public _studentService: StudentImportServiceProxy,
    public bsModalRef: BsModalRef,
    private cd: ChangeDetectorRef
  ) {
    super(injector);
  }

  ngOnInit(): void {
    //this.student.isActive = true;
    this.cd.detectChanges();
  }

  save(): void {
    this.saving = true;

    this._studentService.create(this.student).subscribe(
      () => {
        this.notify.info(this.l('SavedSuccessfully'));
        this.bsModalRef.hide();
        this.onSave.emit();
      },
      () => {
        this.saving = false;
      }
    );
  }
  
}
