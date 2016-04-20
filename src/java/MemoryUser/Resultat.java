
package MemoryUser;

/**
*
* @author stephane.grangier
*/
public class Resultat implements Comparable<Resultat>{

    private String user;
    private Integer points;
    private Integer rang;

    public Resultat(String user, Integer points) {
        this.user = user;
        this.points = points;
        this.rang = 0;

    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Integer getRang() {
        return rang;
    }

    public void setRang(Integer rang) {
        this.rang = rang;
    }

    public int compareTo(Resultat o) {
       
        if (this.points < o.points) {
            return -1;
        } else if (this.points > o.points) {
            return 1;
        } else {
            return 0;
        }
    }

}
