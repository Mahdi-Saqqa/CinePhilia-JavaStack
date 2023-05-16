package com.ner3k.cinephilia.models;


import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="users")
public class User {


    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;


    @Pattern(regexp = "^[a-zA-Z]+$",message = "User Name Contains invalid characters")
    @NotEmpty(message = "User Name is required!")
    @Size(message = "Size must be between 4 and 30 Characters!")
    private String username;


    @NotEmpty(message = "Email is required")
    @Email(message = "Email must be valid")
    private String email;


    @NotEmpty(message = "Password must not be empty")
    @Size(min=8,max=128,message="Password must be at least 8 and at most 128 characters")
    private String password;


    @Transient
    @NotEmpty(message = "Confirm password is required")
    @Size(min=8,max=128,message="Confirm password must be at least 8 and at most 128 characters")
    private String confirmPassword;


    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dob;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
