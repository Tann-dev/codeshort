import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs/internal/Observable";
import { throwError } from "rxjs/internal/observable/throwError";
import { catchError } from "rxjs/internal/operators/catchError";
import { environment } from "src/environment/environment";

@Injectable({
    providedIn: 'root'
})
  
export class UserService {
    private apiURL = environment.apiKey;

    constructor(private httpClient: HttpClient) { }

    getUserProps(username : string): Observable<any> {
        return this.httpClient.get<any>(this.apiURL + '/user/' + username)
            .pipe(
              catchError(this.errorHandler)
            )
    }
  
    postFollowUser(username: string, follow : boolean ) {
      if (follow) {
          return this.httpClient.post<any>(this.apiURL + '/user/unfollow/' + username, JSON.stringify({}))
          .pipe(
            catchError(this.errorHandler)
          )
      } else {
          return this.httpClient.post<any>(this.apiURL + '/user/follow/' + username, JSON.stringify({}))
          .pipe(
            catchError(this.errorHandler)
          )
      }
    }

    postChangePicture(file: File) {
        const  formData = new FormData();
        formData.append("file", file);
        return this.httpClient.post<any>(this.apiURL + '/user/picture' , formData)
        .pipe(
          catchError(this.errorHandler)
        )
    }

    postFavoritesTopics(topics: string[]) {

      const request = {
        topics: topics,
      }

      return this.httpClient.post<any>(this.apiURL + '/user/topics', JSON.stringify(request))
      .pipe(
        catchError(this.errorHandler)
      )
    }

    errorHandler(error: { error: { message: string; }; status: any; message: any; }) {
        let errorMessage = '';
        if(error.error instanceof ErrorEvent) {
          errorMessage = error.error.message;
        } else {
          errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
        }
        return throwError(errorMessage);
    }

}