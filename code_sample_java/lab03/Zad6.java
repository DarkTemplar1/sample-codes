package code_sample_java.lab03;
import java.util.Scanner;

public class Zad6 {
    public class Character {
        Character(int hp, int dmg, int armor, boolean isDead, String name){
            this.hp = hp; this.dmg = dmg; this.armor = armor; this.isDead = isDead; this.name = name;
        }
        int hp, dmg, armor;
        String name;
        boolean isDead;
        public void status(){
            System.out.println( name + "\nPunkty życia: " + hp );
        }
        public int diceRoll(){ return (int) (Math.random() * (20 - 1)) + 1;}
    }

    static Scanner input = new Scanner(System.in);
    int  hp, dmg, arm;
    String name;
    void swt() {
        switch (input.nextInt()) {
            case 1 -> { hp = 10; dmg = 6; arm = 3; name = "Magiczny Marek"; }
            case 2 -> { hp = 10; dmg = 10; arm = 10; name = "Wojak Wojownik"; }
            case 3 -> { hp = 20; dmg = 15; arm = 5; name = "Crag Hack Barbarzyńca"; }
            default -> { hp = 1; dmg = 1; arm = 1; name = " "; }
        }
    }
    private void fight(Character attacker, Character defender){
        if(attacker.diceRoll() > defender.armor){
            defender.hp -= attacker.dmg;
            if(defender.hp <= 0){ defender.isDead = true;}
            System.out.println( attacker.name +" zadaje " + attacker.dmg + " obrażeń przeciwnikowi");
            defender.status();
        }
        else{
            System.out.println( attacker.name +" nie trafia w przeciwnika");
        }
    }

    public void main(String[] args) {
        String wt;
        Zad6 zad = new Zad6();
        System.out.println(
                """
                        Wybierz jeden z dostępnych zestawów Broni / Pancerza:
                        1) Nóż i płaszcz
                        2) Miecz i zbroja
                        3) Siekiera i nic"""
        );
        zad.swt();
        Character player = new Character(zad.hp, zad.dmg, zad.arm, false, "Gracz");
        System.out.println(
                """
                        Wybierz jednego z przeciwników:
                        1) Magiczny Marek
                        2) Wojak Wojownik
                        3) Crag Hack Barbarzyńca"""
        );
        zad.swt();
        Character enemy = new Character(zad.hp, zad.dmg, zad.arm, false, zad.name);
        while (!player.isDead && !enemy.isDead){
            zad.fight(player, enemy);
            if (enemy.isDead){ break; }
            input.nextLine();
            System.out.println("Wciśnij dowolny przycisk, aby kontynuować");
            wt = input.nextLine();
            zad.fight(enemy, player);
        }
        if(player.isDead){ System.out.println(enemy.name + " wygrał"); }
        else{ System.out.println("Gracz wygrał"); }
    }
}