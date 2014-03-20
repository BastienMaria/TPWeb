package utilisateurs.gestionnaires;

import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

@Stateless
public class GestionnaireUtilisateurs {

    // Ici injection de code : on n'initialise pas. L'entity manager sera créé  
    // à partir du contenu de persistence.xml  
    @PersistenceContext
    private EntityManager em;

    public void creerUtilisateursDeTest() {
        creeUtilisateur("John", "Lennon", "jlennon");
        creeUtilisateur("Paul", "Mac Cartney", "pmc");
        creeUtilisateur("Ringo", "Starr", "rstarr");
        creeUtilisateur("Georges", "Harisson", "georgesH");
    }

    public Utilisateur creeUtilisateur(String nom, String prenom, String login) {
        Utilisateur u = new Utilisateur(nom, prenom, login);
        em.persist(u);
        return u;
    }

    public Collection<Utilisateur> chercherParLogin(String login, int startPosition) {
        Query q = em.createQuery("select u from Utilisateur u where lower(u.login) = :login");
        q.setParameter("login", login.toLowerCase());
        q.setMaxResults(10);
        q.setFirstResult(startPosition - 1);

        return q.getResultList();
    }

    public int updateUsers(String login, String newFirstname, String newLastname) {
        int updatesCount;

        Query q = em.createQuery("update Utilisateur u set  u.firstname = :firstname , u.lastname = :lastname where lower(u.login) = :login");
        q.setParameter("firstname", newFirstname);
        q.setParameter("lastname", newLastname);
        q.setParameter("login", login);
        updatesCount = q.executeUpdate();

        return updatesCount;
    }

    public int deleteUsers(Collection<Utilisateur> users) {
        int deletedCount = 0;

        for (final Utilisateur user : users) {
            Query q = em.createQuery("delete from Utilisateur u where u = :user");
            q.setParameter("user", user);
            deletedCount += q.executeUpdate();
        }

        return deletedCount;
    }

    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        return q.getResultList();
    }
    // Add business logic below. (Right-click in editor and choose  
    // "Insert Code > Add Business Method")  
}
