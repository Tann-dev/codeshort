import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { BehaviorSubject } from 'rxjs';
import { AnecdotesService } from 'src/app/services/anecdotes.service';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { UserService } from 'src/app/services/user.service';
import { environment } from 'src/environment/environment';
import { Anecdote } from 'src/models/anecdote.model';
import { UserProps } from 'src/models/user-props.model';
import { DialogEditProfilComponent } from '../dialog-edit-profil/dialog-edit-profil.component';

@Component({
    selector: 'app-profil-card',
    templateUrl: './profil-card.component.html',
    styleUrls: ['./profil-card.component.scss'],
    standalone: false
})
export class ProfilCardComponent implements OnInit {
  @Input() user!: string;
  anecdotes = new BehaviorSubject<Anecdote[] | null>(null);
  me: string | null = null;
  starredFilter!: boolean;
  userProps: UserProps | null = null;

  constructor(public authentificationService: AuthentificationService, 
    private anecdotesService: AnecdotesService, 
    private userService : UserService,
    public dialog: MatDialog) { }
  
  ngOnInit(): void {
    this.starredFilter = false;
    this.getAll();
    this.me = this.authentificationService.getUser();
    this.userService.getUserProps(this.user).subscribe(data => {
      if(data.profilePictureURI)
        data.profilePictureURI = environment.serverKey + "/images/" + data.profilePictureURI;
      else
        data.profilePictureURI = "../../../assets/images/user.svg";
      this.userProps = data;
    });
  }
  
  showStarred() {
    if(!this.starredFilter){
      this.getAllStarred();
    }else {
      this.getAll();
    }
  }

  clickFollow() {
    if (this.userProps) {
      this.userService.postFollowUser(this.user, this.userProps?.followed).subscribe(data => {
        this.userProps!.followed = !this.userProps?.followed;
      });
    }
  }

  goToGitHub() {
    if(this.userProps?.gitURI) window.location.href = this.userProps.gitURI;
  }

  getAllStarred() {
    this.anecdotesService.getStarred(this.user).subscribe(data => {
      var anecdotesTmp: Anecdote[] = [];
      data.anecdotes.forEach((e : any) => {
        var anecdote: Anecdote = {
          id: e.id,
          topics: e.topics,
          description: e.content,
          upvotes: e.upvotes,
          downvotes: e.downvotes,
          starred: e.starred,
          owner: e.author,
          vote: e.vote,
          pictureUri: e.pictureUri != null ? environment.serverKey + "/images/" + e.pictureUri : null
        };
        anecdotesTmp.push(anecdote);
      });
      this.anecdotes.next(anecdotesTmp);
      this.starredFilter = true;
    })
  }

  getAll() {
    this.anecdotesService.getAnecdotesFromUsername(this.user).subscribe(data => {
      var anecdotesTmp: Anecdote[] = [];
      data.anecdotes.forEach((e : any) => {
        var anecdote: Anecdote = {
          id: e.id,
          topics: e.topics,
          description: e.content,
          upvotes: e.upvotes,
          downvotes: e.downvotes,
          starred: e.starred,
          owner: e.author,
          vote: e.vote,
          pictureUri: e.pictureUri != null ? environment.serverKey + "/images/" + e.pictureUri : null
        };
        anecdotesTmp.push(anecdote);
      });
        this.anecdotes.next(anecdotesTmp);
        this.starredFilter = false;
    })
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogEditProfilComponent, {
      width: '40%',
      data: {name: this.me, picture: this.userProps?.profilePictureURI}
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result !== null)
        this.authentificationService.setLinkPicture(result);
        this.userProps!.profilePictureURI = this.authentificationService.getLinkPicture();
    });
  }
}
