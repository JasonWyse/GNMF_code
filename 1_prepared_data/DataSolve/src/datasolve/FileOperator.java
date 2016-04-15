package datasolve;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class FileOperator {
	public static ArrayList<String> ReadFile(String filename, Character mark1, Character mark2, String[] signs, int[] indexs){
		ArrayList<String> map = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String buff = null;
			while((buff = reader.readLine()) != null){
				if((buff.charAt(0) == mark1 && buff.charAt(3) == mark2) || mark1 == '.' ){
					if(FileOperator.Takeof(buff, signs, indexs) != ""){
						map.add(FileOperator.Takeof(buff, signs, indexs));
					}
					
				}
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("read success!");
		return map;
	}
	public static ArrayList<String> ReadFile(String filename, String mark, String outmark){
		ArrayList<String> tree = new ArrayList<String>();
		boolean lock = false;
		boolean backup = false;
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String buff = null;
			String id = null;
			while((buff = reader.readLine()) != null){
				buff = buff.trim();
				if(lock){
					if(backup){
						tree.add(id + " " + "0");
					}
					id = FileOperator.SingleSplit(FileOperator.SingleSplit(buff, " "), ":");
					lock = false;
					backup = true;
				}else if(buff.equals(mark)){
					lock = true;
				}else if(buff.length() > 4 && buff.substring(0, 4).equals("is_a")){
					tree.add(id + " " + FileOperator.SingleSplit(FileOperator.SingleSplit(buff, " "), ":"));
					backup = false;
				}else if(buff.equals(outmark)){
					System.out.println("read success!");
					reader.close();
					return tree;
				}
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("read success!");
		return tree;
	}
	public static ArrayList<String> ReadTuple(String filename){
		ArrayList<String> arr = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String buff = null;
			while((buff = reader.readLine()) != null){
				arr.add(buff.trim());
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return arr;
	}
	public static String Takeof(String str, String[] signs, int[] indexs){
		String[] buffs = str.trim().split(signs[0]);
		if(buffs.length > indexs[1]){
			return FileOperator.SingleSplit(buffs[indexs[0]], signs[1]) + " "  + FileOperator.SingleSplit(buffs[indexs[1]], signs[1]);
		}else{
			return "";
		}
	}
	public static ArrayList<String> CutHead(ArrayList<String> arr){
		arr.remove(0);
		return arr;
	}
	public static String SingleSplit(String str, String sign){
		String[] blocks = str.split(sign);
		if(blocks.length == 1){
			return blocks[0];
		}
		return blocks[1];
 	}
	public static void WriteFile(ArrayList<String>data, String filename){
		try{
			BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
			for(int i = 0; i < data.size(); ++i){
				writer.write(data.get(i) + "\r\n");
			}
			writer.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("write success!");
	}
	public static ArrayList<String> SpecialReadFile(String filename){
		ArrayList<String> buffs = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String str = null;
			String[] buflines;
			String[] tmpbuf;
			String check = null;
 			while((str = reader.readLine()) != null){
				buflines = str.trim().split("\t");
				if(buflines.length > 1){
					tmpbuf = buflines[0].split(" ");
					check = tmpbuf[tmpbuf.length - 2];
					if(check.length() == 6&&check.charAt(check.length()-1) < 58 && check.charAt(check.length()-1) > 47&&check.charAt(0) < 58 && check.charAt(0) > 47){
						buffs.add(buflines[2] + " " + check);
					}
				}
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("special read success!");
		return buffs;
	}
	public static ArrayList<String> BlcoksReadFile(String filename){
		ArrayList<String> buff = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String[] blocks;
			String line = null;
			while((line = reader.readLine()) != null){
				blocks = line.trim().split("\t");
				if(!blocks[1].equals("-") && blocks[2].equals("gene")){
					buff.add(blocks[0] + " " + blocks[1]);
				}
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("blocks read success!");
		return buff;
	}
	public static ArrayList<String> ReadHomFile(String filename){
		ArrayList<String> buff = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String rece = null;
			String[] window = new String[]{};
			String[] stand = new String[]{"0", "0", "0"};
			ArrayList<String> stack = new ArrayList<String>();
			while((rece = reader.readLine()) != null){
				window = rece.trim().split("\t");
				if(stand[0].equals(window[0])){
					if(!stand[1].equals(window[2])){
						for(String s:stack){
							buff.add(s + " " + window[4]); 
						}
					}else{
						stack.add(window[4]);
					}
				}else{
					stand[0] = window[0];
					stand[1] = window[2];
					stack.clear();
					stack.add(window[4]);
				}
			}
 			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("read hom success!");
		return buff;
	}
	public static ArrayList<String> ReadTuple(String filename, String sign){
		ArrayList<String> rece = new ArrayList<String>();
		try{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			String readingline = null;
			while((readingline = reader.readLine()) != null){
				rece.add(readingline.trim().replace(sign, " "));
			}
			reader.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return rece;
	}
}

