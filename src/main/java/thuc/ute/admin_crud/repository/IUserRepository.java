package thuc.ute.admin_crud.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thuc.ute.admin_crud.entity.User;

import java.util.Optional;

@Repository
public interface IUserRepository
        extends JpaRepository<User, Integer> {

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Page<User> findByUsernameContaining(
            String keyword,
            Pageable pageable
    );

    Page<User> findByFullnameContaining(
            String keyword,
            Pageable pageable
    );

    Page<User> findByUsernameContainingOrFullnameContaining(
            String username,
            String fullname,
            Pageable pageable
    );
}