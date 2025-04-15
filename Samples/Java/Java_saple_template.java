import javax.swing.*;

public class Main {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.setSize(800, 600);
        frame.setLayout(null);
        frame.setTitle("Logowanie do systemu");

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    public static void serialize(String fileName){
        var List<Object> objects; // example list
        try {
            ObjectOutputStream oos =
            new ObjectOutputStream(new FileOutputStream(fileName));
           
            for (var object : objects) {
            oos.writeObject(object);
            }
           } catch (IOException e) {
            // obsługa wyjątków
           }
           
    }

    public static void deserialize(String fileName){
        try {
            ObjectInputStream ois =
            new ObjectInputStream(new FileInputStream(fileName));
           
            // Pętla nieskończona, która będzie przerwana wyjątkiem
           EOFException
            while (true) {
            try {
                Object o = (Object) ois.readObject();
            //aby sprawdzić w konsoli: System.out.println(o.toString());
            } catch (EOFException e) {
            break; // Przerwanie pętli po osiągnięciu końca pliku
            }
            }
           } catch (IOException e) {
            // obsługa wyjątków
           }
    }

    public static void readTextFile(String fileName){
        File file = new File(fileName);
        try {
            FileReader fileReader = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            String line = bufferedReader.readLine();
        } catch (FileNotFoundException e) {
            // obsługa wyjątku
        }
    }

    public static void writeTextFile(String fileName){
        File file = new File("test.txt");
        try {
            FileWriter fileWriter = new FileWriter(file);
            BufferedWriter bufferedWriter = new
            BufferedWriter(fileWriter);
            bufferedWriter.write("string to write");
            bufferedWriter.newLine();
        } catch (IOException e) {
            // obsługa wyjątku
        }
    }

}