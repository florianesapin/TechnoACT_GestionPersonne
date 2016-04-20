
package MemoryUser;

import java.util.Collections;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
*
* @author francill, Stéphane Grangier
*/
public class Utilisateurs {

    public static Hashtable<String, String> users = null;
    public static Hashtable<String, Integer> scores = null;

    public static boolean verifyUser(String user, String pw) {
        if (users == null) {
            users = new Hashtable<String, String>();
            users.put("termine", "ptermine");
            users.put("daucourt", "pdaucourt");
            users.put("francillon", "pfrancillon");
            users.put("dupont", "pdupont");
            users.put("test", "test");

            initilisationScores();
        }
        System.out.println(user + " " + pw + " " + users.get(user));
        if (users.get(user) != null) {
            if (users.get(user).equals(pw)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }

    }

    public static void initilisationScores() {
        if (scores == null) {
            scores = new Hashtable<String, Integer>();
            scores.put("termine", 48);
            scores.put("daucourt", 50);
            scores.put("francillon", 55);
            scores.put("dupont", 60);
            scores.put("test", 12);
        }
    }

    public static void modifieScore(String user, Integer points) {
        Integer scoreActuel = scores.get(user);
        Integer scoreNouveau = scoreActuel + points;

        if (scoreNouveau < 0) {
            scoreNouveau = 0;
        }
        scores.replace(user, scoreNouveau);
    }

    public static List<Resultat> getClassementGeneral() {
        List<Resultat> classement = new LinkedList();

        //converti la map "scores" en une collection de "Resultat"
        for (Map.Entry<String, Integer> entry : scores.entrySet()) {
            Resultat resultat = new Resultat(entry.getKey(), entry.getValue());
            classement.add(resultat);
        }

        //tri du classement
        Collections.sort(classement);
        Collections.reverse(classement);

        return classement;
    }

    public static List<Resultat> getPodium(String userConnecte) {
        List<Resultat> classement = getClassementGeneral();
        List<Resultat> podium = new LinkedList();
        boolean userTrouve = false;

        for (int i = 0; i < 3; i++) {
            classement.get(i).setRang(i + 1);
            podium.add(classement.get(i));

            //tester si l'utilisateur est dans les 3 premiers
            if (classement.get(i).getUser().equals(userConnecte)) {
                userTrouve = true;
            }
        }
           
        //si l'utilisateur n'est pas dans les 3 premiers, on l'ajoute
        if (!userTrouve) {
            for (Resultat resultat : classement) {
                if (resultat.getUser().equals(userConnecte)) {
                    podium.add(resultat);
                }
            }
        }

        return podium;

    }


}
