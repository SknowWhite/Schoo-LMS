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
  StudentImportServiceProxy,
  StudentDTO
} from '@shared/service-proxies/service-proxies';


@Component({
  selector: 'app-edit-student',
  templateUrl: './edit-student.component.html',
  styleUrl: './edit-student.component.css'
})
export class EditStudentComponent  extends AppComponentBase
implements OnInit {
saving = false;
student: StudentDTO =new StudentDTO();
id: number;

@Output() onSave = new EventEmitter<any>();

constructor(
  injector: Injector,
  public _tenantService: StudentImportServiceProxy,
  public bsModalRef: BsModalRef,
  private cd: ChangeDetectorRef
) {
  super(injector);
}

ngOnInit(): void {
  this._tenantService.get(this.id).subscribe((result: StudentDTO) => {
    this.student = result;
    this.cd.detectChanges();
  });
}

save(): void {
  this.saving = true;

  this._tenantService.update(this.student).subscribe(
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
