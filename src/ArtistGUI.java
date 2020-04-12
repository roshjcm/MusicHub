import java.awt.*;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class ArtistGUI {
	private int uid ;
	private String stage_name;
	private ArrayList<String[]> library;
	private float balance;
	
	private static JFrame frame;
	private static JPanel panel;
	private static JLabel title;
	
	private static JLabel balanceLabel;
	
	JTable libraryDisplay;
	
	
	public ArtistGUI(int uid, String stage_name, int balance) {
		this.uid = uid;
		this.stage_name = stage_name;
		library = getLibrary();
		this.balance = balance;
		
		frame = new JFrame();  // the window
		panel = new JPanel();
		
		title = new JLabel("Account info and Music Work of " + stage_name);
		panel.setBorder(BorderFactory.createEmptyBorder(30, 30, 10, 30));
		panel.setLayout(new FlowLayout(FlowLayout.LEFT));
		panel.add(title);
		//Container contentPane = new Container();
		
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Artist account of " + uid);
		
		balanceLabel = new JLabel("Account balance is of $" + balance);
		//balanceLabel.setBounds(10,20,80,25);
		panel.add(balanceLabel, BorderLayout.AFTER_LAST_LINE);
		
		String[] columnNames = {"Song", "Album", "Genre", "Price ($)"};
		String[][] data = new String[library.size()][];
		
		for(int i = 0 ; i< library.size(); i++) {
			data[i] = library.get(i);
		}
		
		libraryDisplay = new JTable(data, columnNames);
		libraryDisplay.setBounds(30, 40, 200, 300);
		
		JScrollPane sp = new JScrollPane(libraryDisplay); 
//		contentPane.add(sp, BorderLayout.EAST);
//		contentPane.add(panel, BorderLayout.WEST);
//		
		
		frame.add(sp, BorderLayout.EAST);
		frame.add(panel, BorderLayout.WEST);
		frame.pack();
		frame.setVisible(true);
		
		
	}
	
	private ArrayList<String[]> getLibrary() {
		
		//Function that will give you the library of an artist
	
		ArrayList<String[]> temp = new ArrayList<String[]>();
		temp.add(new String[] {"Hello", "", "Pop", "0.0"});
		temp.add(new String[] {"Hi", "Bonjour", "Rock", "0.0"});
		temp.add(new String[] {"Craming", "", "Depresion", "0.0"});
		temp.add(new String[] {"Bas alors", "ok", "BoomBoomTam", "0.0"});
		return temp;
	}
	
	private void addAMusic(char[] music) {
		//function that will add a music
	}
	
	public static void main(String[] args) {
		new ArtistGUI(26077889, "raRa_tam", 5);
	}

}
