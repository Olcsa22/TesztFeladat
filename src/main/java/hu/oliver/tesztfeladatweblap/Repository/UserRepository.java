package hu.oliver.tesztfeladatweblap.Repository;

import hu.oliver.tesztfeladatweblap.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByUsername(String username);
}
