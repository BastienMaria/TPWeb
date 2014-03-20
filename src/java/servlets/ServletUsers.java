/* 
 * To change this template, choose Tools | Templates 
 * and open the template in the editor. 
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author michel
 */
@WebServlet(name = "ServletUsers", urlPatterns = {"/ServletUsers"})
public class ServletUsers extends HttpServlet {

    @EJB
    private GestionnaireUtilisateurs gestionnaireUtilisateurs;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pratique pour décider de l'action à faire  
        String action = request.getParameter("action");
        String forwardTo = "";
        String message = "";

        if (action != null) {
            switch (action) {
                case "listerLesUtilisateurs": {
                    Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "index.jsp?action=listerLesUtilisateurs&page=1";
                    message = "Liste des utilisateurs";
                    break;
                }
                case "datatables": {
                    Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();

                    String virgule = ",";

                    String myJson = "{\n"
                            + "    \"aaData\": [";

                    for (Iterator<Utilisateur> it = liste.iterator(); it.hasNext();) {
                        Utilisateur utilisateur = it.next();
                        myJson += "[" + " \"" + utilisateur.getLogin() + "\",";
                        myJson += "\"" + utilisateur.getFirstname() + "\",";
                        myJson += "\"" + utilisateur.getLastname() + "\"]";
                        if (it.hasNext()) {
                            myJson += virgule;
                        }
                    }
                    myJson += "]\n"
                            + "}";
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    out.print(myJson);
                    out.flush();
                    break;
                }
                case "creerUtilisateursDeTest": {
                    gestionnaireUtilisateurs.creerUtilisateursDeTest();
                    Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "index.jsp?action=listerLesUtilisateurs&page=1";
                    message = "Liste des utilisateurs";
                    break;
                }
                case "creerUnUtilisateur": {
                    Collection<Utilisateur> liste = new ArrayList<>();
                    Utilisateur u = gestionnaireUtilisateurs.creeUtilisateur(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("login"));
                    liste.add(u);
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "index.jsp?action=listerLesUtilisateurs&page=1";
                    message = "Utilisateur créé";
                    break;
                }
                case "chercherParLogin": {
                    Collection<Utilisateur> liste = gestionnaireUtilisateurs.chercherParLogin(request.getParameter("login"), 1);
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "index.jsp?action=listerLesUtilisateurs&page=1";
                    int countUsersFound = liste.size();
                    message = countUsersFound + " utilisateur(s) trouvé(s)";
                    break;
                }
                case "updateUtilisateur": {
                    // int updatedCount = gestionnaireUtilisateurs.updateUsers(request.getParameter("login"), request.getParameter("prenom"), request.getParameter("nom"));
                    Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "index.jsp?action=listerLesUtilisateurs&page=1";
                    //  message = updatedCount + " utilisateur(s) modifié(s)";
                    break;
                }
                default:
                    forwardTo = "index.jsp?action=todo";
                    message = "La fonctionnalité pour le paramètre " + action + " est à implémenter !";
                    break;
            }
        }

        RequestDispatcher dp = request.getRequestDispatcher(forwardTo + "&message=" + message);
        dp.forward(request, response);
        // Après un forward, plus rien ne peut être exécuté après !  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
