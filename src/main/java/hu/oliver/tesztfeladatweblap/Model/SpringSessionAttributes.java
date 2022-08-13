package hu.oliver.tesztfeladatweblap.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "spring_session_attributes")
public class SpringSessionAttributes {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "attribute_bytes")
    private byte[] attributeBytes;

    @Column(name = "attribute_name")
    private String attributeName;

    @Column(name = "session_primary_id")
    private String sessionPrimaryId;
}
