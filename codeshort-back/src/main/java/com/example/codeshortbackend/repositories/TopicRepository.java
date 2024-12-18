package com.example.codeshortbackend.repositories;

import com.example.codeshortbackend.models.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface TopicRepository extends JpaRepository<Topic, String> {
    List<Topic> findAllByNameIn(List<String> names);
    Optional<Topic> findByName(String name);
}
