import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { UserService } from 'src/app/services/user.service';

@Component({
    selector: 'app-dialog-edit-profil',
    templateUrl: './dialog-edit-profil.component.html',
    styleUrls: ['./dialog-edit-profil.component.scss'],
    standalone: false
})
export class DialogEditProfilComponent {
  constructor(
    public dialogRef: MatDialogRef<DialogEditProfilComponent>,
    private userService : UserService,
    @Inject(MAT_DIALOG_DATA) public data: any) {}

    URL: any = null
    file: File | null = null

    ngOnInit(): void {
      this.URL = this.data.picture
    }

    useImage(event: Event) {
      const input = event.target as HTMLInputElement;
      if (input?.files?.length) {
        this.file = input.files[0];
        const reader = new FileReader();
        reader.readAsDataURL(this.file); // Read file as data url
        reader.onloadend = (e) => { // function call once readAsDataUrl is completed
          this.URL = e.target? e.target['result'] : null; // Set image in element
        };
      }
    }

    closeDialog() {
      if (this.file === null) {
        this.dialogRef.close();
        return;
      }

      this.userService.postChangePicture(this.file).subscribe((data: any) => {
        this.dialogRef.close(data.response);
      });
    }
}
