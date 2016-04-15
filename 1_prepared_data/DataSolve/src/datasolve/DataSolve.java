package datasolve;

import java.util.ArrayList;
import java.util.HashMap;

public class DataSolve {
	public static HashMap<Integer, Integer> Merge(ArrayList<Tuple> a1, ArrayList<Tuple> a2){
		a1.addAll(a2);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i = 0; i < a1.size(); ++i){
			if(!map.containsKey(a1.get(i).head)){
				map.put(a1.get(i).head, a1.get(i).tail);
			}
		}
		return map;
	}
	public static ArrayList<Tuple> DataTrans(ArrayList<String> arr){
		ArrayList<Tuple> tuplelist = new ArrayList<Tuple>();
		for(int i = 0; i < arr.size(); ++i){
			tuplelist.add(Tuple.Parse(arr.get(i)));
		}
		return tuplelist;
	}
	public static ArrayList<String> MapToString(HashMap<Integer, Integer> map){
		ArrayList<String> outlines = new ArrayList<String>();
		Tuple tuple;
		for(Integer key:map.keySet()){
			tuple = new Tuple(key, map.get(key));
			outlines.add(tuple.toString());
		}
		return outlines;
	}
	public static ArrayList<String> Foramt(ArrayList<String> ori){
		ArrayList<String> out = new ArrayList<String>();
		int maxrecord = 0;
		String[] blocks;
		int[] zerosnumber = new int[ori.size()];
 		for(int i = 0; i < ori.size(); ++i){
 			blocks = ori.get(i).trim().split(" ");
 			zerosnumber[i] = blocks.length;
			maxrecord = Math.max(maxrecord, blocks.length);
			//System.out.println((i+1) + " : " +blocks.length + " / " + maxrecord);
		}
 		for(int i = 0; i < ori.size(); ++i){
 			out.add(ori.get(i)+ DataSolve.ZeroBuilder(maxrecord - zerosnumber[i]));
 		}
 		System.out.println("format full success!");
 		return out;
	}
	public static String ZeroBuilder(int num){
		String zeros = "";
		for(int i = 0; i < num; ++i){
			zeros += " 0";
		}
		return zeros;
	}
}
