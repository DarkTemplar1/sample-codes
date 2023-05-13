package code_sample_java.lab03;
import java.util.Scanner;

public class zad03 {


        public static void main(String[] args) {
            TV tv = new TV();
            tv.setVolume(50);
            tv.setChannel(50);
            Remote remote = new Remote(tv);
            Scanner scanner = new Scanner(System.in);

            boolean exit = false;
            while (!exit) {
                System.out.println("którą opcje chcesz wybrać ");
                System.out.println("1. Change channel");
                System.out.println("2. Change volume");
                System.out.println("3. Turn TV on/off");
                System.out.println("4. Exit");
                int choice = scanner.nextInt();

                switch (choice) {
                    case 1 -> remote.changeChannel();
                    case 2 -> remote.changeVolume();
                    case 3 -> remote.turnOnOff();
                    case 4 -> exit = true;
                    default -> System.out.println("Invalid choice");
                }
            }
        }
    }

    class TV {
        private int channel;
        private int volume;
        private boolean on;

        public TV() {
            this.channel = 1;
            this.volume = 1;
            this.on = false;
        }
        public void setChannel(int channel) {
            if (on) {
                if (channel >= 1 && channel <= 20) {
                    this.channel = channel;
                    System.out.println("Channel set to " + channel);
                } else {
                    System.out.println("Invalid channel");
                }
            } else {
                System.out.println("TV is off");
            }
        }

        public int getVolume() {
            return volume;
        }

        public void setVolume(int volume) {
            if (on) {
                if (volume >= 1 && volume <= 10) {
                    this.volume = volume;
                    System.out.println("Volume set to " + volume);
                } else {
                    System.out.println("Invalid volume");
                }
            } else {
                System.out.println("TV is off");
            }
        }

        public boolean isOn() {
            return on;
        }

        public void setOn(boolean on) {
            this.on = on;
            if (on) {
                System.out.println("TV turned on");
            } else {
                System.out.println("TV turned off");
            }
        }

        public int getChannel() {
            return channel;
        }
    }

    class Remote {
        private final TV tv;

        public Remote(TV tv) {
            this.tv = tv;
        }

        public void changeChannel() {
            System.out.println("Enter new channel:");
            Scanner scanner = new Scanner(System.in);
            int channel = scanner.nextInt();
            tv.setChannel(channel);
        }

        public void changeVolume() {
            System.out.println("Enter new volume:");
            Scanner scanner = new Scanner(System.in);
            int volume = scanner.nextInt();
            tv.setVolume(volume);
        }

        public void turnOnOff() {
            tv.setOn(!tv.isOn());
        }
}


