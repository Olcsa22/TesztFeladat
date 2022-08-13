package hu.oliver.tesztfeladatweblap.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "role")
@Getter
@Setter
public class Role implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 20)
    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

}
