package com.example.codeshortbackend.repositories;

import com.example.codeshortbackend.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface RatingCommentRepository extends JpaRepository<RatingComment, UserCommentKey> {
    Optional<RatingComment> findByUserAndComment(User user, Comment comment);
}
