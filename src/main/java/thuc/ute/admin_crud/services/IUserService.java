package thuc.ute.admin_crud.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import thuc.ute.admin_crud.entity.User;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    User save(User user);

    List<User> findAll();

    Page<User> findAll(Pageable pageable);

    Optional<User> findById(Integer id);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    void deleteById(Integer id);

    long count();

    Page<User> findByUsernameContainingOrFullnameContaining(
            String username,
            String fullname,
            Pageable pageable
    );

    Page<User> search(
            String keyword,
            Integer roleId,
            Boolean active,
            Pageable pageable
    );
}
