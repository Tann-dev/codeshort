import { Vote } from "./vote.model";

export class Comment {
    id!: number;
    content !: string;
    author !: string;
    authorPicture !: string | null;
    upvotes!: number;
    downvotes!: number;
    vote !: Vote;
}