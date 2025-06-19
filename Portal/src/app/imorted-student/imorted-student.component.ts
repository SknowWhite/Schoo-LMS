import { ChangeDetectorRef, Component, Injector } from '@angular/core';
import {
  PagedListingComponentBase,
  PagedRequestDto
} from '@shared/paged-listing-component-base';
import { appModuleAnimation } from '@shared/animations/routerTransition';
import { StudentImportServiceProxy, StudentDTO, StudentDtoPagedResultDto } from '@shared/service-proxies/service-proxies';
import { finalize } from 'rxjs/operators';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { CreateStudentComponent } from './create-student/create-student.component';
import { EditStudentComponent } from './edit-student/edit-student.component';


class PagedStudentRequestDto extends PagedRequestDto {
  keyword: string;
}

@Component({
  selector: 'app-imorted-student',
  templateUrl: './imorted-student.component.html',
  styleUrl: './imorted-student.component.css',
  animations: [appModuleAnimation()]
})
export class ImortedStudentComponent extends PagedListingComponentBase<StudentDTO> {
  students: StudentDTO[] = [];
  keyword = '';
  constructor(
    injector: Injector,
    private _studentService: StudentImportServiceProxy,
    private _modalService: BsModalService,
    cd: ChangeDetectorRef
  ) {
    super(injector, cd);
  }
  list(
    request: PagedStudentRequestDto,
    pageNumber: number,
    finishedCallback: Function
  ): void {
    request.keyword = this.keyword;

    this._studentService
      .getAll(request.keyword, request.skipCount, request.maxResultCount)
      .pipe(
        finalize(() => {
          finishedCallback();
        })
      )
      .subscribe((result: StudentDtoPagedResultDto) => {
        this.students = result.items;
        console.log(this.students)
        this.showPaging(result, pageNumber);
        this.cd.detectChanges();
      });
  }

  delete(student: StudentDTO): void {
    abp.message.confirm(
      this.l('StudentDeleteWarningMessage', student.name),
      undefined,
      (result: boolean) => {
        if (result) {
          this._studentService
            .delete(student.id)
            .pipe(
              finalize(() => {
                abp.notify.success(this.l('SuccessfullyDeleted'));
                this.refresh();
              })
            )
            .subscribe(() => {});
        }
      }
    );
  }

  createStudent(): void {
    this.showCreateOrEditStudentDialog();
  }

  editStudent(student: StudentDTO): void {
    this.showCreateOrEditStudentDialog(student.id);
  }

  showCreateOrEditStudentDialog(id?: number): void {
    let createOrEditStudentDialog: BsModalRef;
    if (!id) {
      createOrEditStudentDialog = this._modalService.show(
        CreateStudentComponent,
        {
          class: 'modal-lg',
        }
      );
    } else {
      createOrEditStudentDialog = this._modalService.show(
        EditStudentComponent,
        {
          class: 'modal-lg',
          initialState: {
            id: id,
          },
        }
      );  
    }

    createOrEditStudentDialog.content.onSave.subscribe(() => {
      this.refresh();
    });
  }

}
