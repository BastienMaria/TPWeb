package utilisateurs.gestionnaires;

import com.googlecode.jcsv.reader.CSVReader;
import com.googlecode.jcsv.reader.internal.CSVReaderBuilder;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Collection;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;
import utils.csv.UtilisateurEntryParser;

@Stateless
public class GestionnaireUtilisateurs {

    // Ici injection de code : on n'initialise pas. L'entity manager sera créé  
    // à partir du contenu de persistence.xml  
    @PersistenceContext
    private EntityManager em;

//    public void creerUtilisateursDeTest() {
//        creeUtilisateur("John", "Lennon", "jlennon");
//        creeUtilisateur("Paul", "Mac Cartney", "pmc");
//        creeUtilisateur("Ringo", "Starr", "rstarr");
//        creeUtilisateur("Georges", "Harisson", "georgesH");
//        for (int i = 0; i < 15; i++) {
//            creeUtilisateur("testPrenom" + i, "testNom" + i, "testLogin" + i);
//
//        }
//    }
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

    public boolean updateUsers(Utilisateur user) {

        try {
            em.merge(user);
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public boolean deleteUsers(int id) {

        Utilisateur u = em.find(Utilisateur.class, id);

        try {
            em.remove(u);
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        //q.setFirstResult(startPosition - 1);
        return q.getResultList();
    }

    //TODO
    public Collection<Utilisateur> getAllUsersPaginated() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        q.setMaxResults(10);
        //q.setFirstResult(startPosition - 1);
        return q.getResultList();
    }
    // Add business logic below. (Right-click in editor and choose  
    // "Insert Code > Add Business Method")  

    public List<Utilisateur> generateData() throws FileNotFoundException, IOException {
        Reader reader = new FileReader("/media/Data/Bibliothèques/Documents/MIAGE M1/WEB/TPWeb/src/main/webapp/data.csv");

        CSVReader<Utilisateur> csvPersonReader = new CSVReaderBuilder<Utilisateur>(reader).entryParser(new UtilisateurEntryParser()).build();

        List<Utilisateur> persons = csvPersonReader.readAll();

        return persons;

    }

}
