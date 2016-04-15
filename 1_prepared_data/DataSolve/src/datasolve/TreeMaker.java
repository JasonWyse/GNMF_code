package datasolve;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

public class TreeMaker {
	private HashMap<Integer, ArrayList<Integer>> TreeMap = new HashMap<Integer, ArrayList<Integer>>();
	private ArrayList<Integer> outline = new ArrayList<Integer>();
	private ArrayList<String> outbuff = new ArrayList<String>();
	private Stack<Integer> SingleStack = new Stack<Integer>();
	
	public HashSet<Integer> Init(ArrayList<String> arr){
		HashSet<Integer> idSet = new HashSet<Integer>();
		String[] buffs;
		int x = 0;
		int y = 0;
 		for(int i = 0 ; i < arr.size(); ++ i){
			buffs = arr.get(i).split(" ");
			x = new Integer(buffs[0]);
			y = new Integer(buffs[1]);
			idSet.add(x);
			if(!this.TreeMap.containsKey(x)){
				this.TreeMap.put(x, new ArrayList<Integer>());
			}
			if(y > 0){
				this.TreeMap.get(x).add(y);
				}
		}
 		return idSet;
	}
	public static String ToString(ArrayList<Integer> arr){
		String out = "";
		for(int i = arr.size() - 1; i > -1; --i){
			out += arr.get(i).toString() + " "; 
		}
		return out;
	}
	public void save(String filename){
		FileOperator.WriteFile(outbuff, filename);
	}
	public void show(int key){
		for(Integer val : this.TreeMap.get(key)){
			System.out.println(val);
		}
	}
	public void ListPush(ArrayList<Integer> arr){
		int i = 0;
		for(; i < arr.size() - 1; ++i){
			this.SingleStack.push(arr.get(i));
		}
		this.SingleStack.push(0);
		this.SingleStack.push(arr.get(i));
	}
	public void Find(int id){
		if(id == 0){
			this.outline.remove(outline.size() - 1);
		}else if(this.TreeMap.get(id).isEmpty()){
			this.outline.add(id);
			this.outbuff.add(TreeMaker.ToString(this.outline));
			this.outline.remove(outline.size()-1);
		}else{
			this.outline.add(id);
			this.ListPush(this.TreeMap.get(id));
		}
		if(this.SingleStack.isEmpty()){
			return;
		}else{
			this.Find(this.SingleStack.pop());
		}
	}
	public void NewLoop(HashSet<Integer> id, TreeMaker tm){
		this.outbuff.clear();
		this.outline.clear();
		for(Integer one : id){
			tm.Find(one);
			System.out.println(one);
		}
		System.out.println("make tree success!");
	}
	public void BigLoop(HashSet<Integer>id, TreeMaker tm){
		this.outbuff.clear();
		this.outline.clear();
		for(Integer one : id){
			tm.Check(one);
			System.out.println(one);
		}
		System.out.println("make tree success!");
	}
	public void Check(int id){
		this.SingleStack.push(id);
		while(!this.SingleStack.isEmpty()){
			this.FindLoop(this.SingleStack.pop());
		}
	}
	public void FindLoop(int id){
		if(id == 0){
			this.outline.remove(outline.size() - 1);
		}else if(this.TreeMap.get(id).isEmpty()){
			this.outline.add(id);
			this.outbuff.add(TreeMaker.ToString(this.outline));
			this.outline.remove(outline.size()-1);
		}else{
			this.outline.add(id);
			this.ListPush(this.TreeMap.get(id));
		}
	}
}
