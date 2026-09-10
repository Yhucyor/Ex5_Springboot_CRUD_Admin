package thuc.ute.admin_crud.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    @Query("""
            SELECT user FROM User user
            WHERE (
                :keyword = ''
                OR LOWER(user.username) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(user.fullname) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(user.email) LIKE LOWER(CONCAT('%', :keyword, '%'))
            )
            AND (:roleId IS NULL OR user.roleId = :roleId)
            AND (:active IS NULL OR user.active = :active)
            """)
    Page<User> search(
            @Param("keyword") String keyword,
            @Param("roleId") Integer roleId,
            @Param("active") Boolean active,
            Pageable pageable
    );
}
