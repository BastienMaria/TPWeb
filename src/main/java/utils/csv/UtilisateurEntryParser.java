/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils.csv;

import com.googlecode.jcsv.reader.CSVEntryParser;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Bastien
 */
public class UtilisateurEntryParser implements CSVEntryParser<Utilisateur> {

    @Override
    public Utilisateur parseEntry(String... data) {
        if (data.length != 3) {
            throw new IllegalArgumentException("data is not a valid person record");
        }

        String login = data[0];
        String firstname = data[1];
        String lastname = data[2];

        return new Utilisateur(login, lastname, firstname);
    }
}
