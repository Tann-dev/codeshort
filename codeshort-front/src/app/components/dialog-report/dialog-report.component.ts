import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AnecdotesService } from 'src/app/services/anecdotes.service';

@Component({
    selector: 'app-dialog-report',
    templateUrl: './dialog-report.component.html',
    styleUrls: ['./dialog-report.component.scss'],
    standalone: false
})
export class DialogReportComponent {

  private anecdoteId: number;

  constructor(
    public dialogRef: MatDialogRef<DialogReportComponent>,
    private anecdotesService: AnecdotesService,
    @Inject(MAT_DIALOG_DATA) public data: any) {
      this.anecdoteId = data.anecdote;
    }


    ngOnInit(): void {
    }

    closeDialog(text: string) {
      this.anecdotesService.reportAnecdote(this.anecdoteId, text).subscribe(() => {
        this.dialogRef.close();
      });
    }
}
