package datasolve;

public class Tuple {
	public int head;
	public int tail;
	
	public Tuple(int head, int tail){
		this.head = head;
		this.tail = tail;
	}
	public static Tuple Parse(String head, String tail){
		return new Tuple(new Integer(head), new Integer(tail)); 
	}
	public static Tuple Parse(String s){
		String[] head_tail = s.split(" ");
		return Tuple.Parse(head_tail[0], head_tail[1]);
	}
	public String toString(){
		return this.head + " " + this.tail;
	}
}
