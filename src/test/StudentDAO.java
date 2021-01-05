package test;

import java.util.ArrayList;

public class StudentDAO {
	
	private static StudentDAO instance = new StudentDAO();
	
    ArrayList<StudentVO> list = new ArrayList<StudentVO>();
 
	public StudentDAO() {
    	StudentVO temp = new StudentVO("qwer", "1111", 100,1);
		list.add(temp);
		temp = new StudentVO("abcd", "2222", 87,2);
		list.add(temp);		
		temp = new StudentVO("javaking", "3333", 42,3);
		list.add(temp);
		
		
	}

	public static StudentDAO getInstance() {
		return instance;
	}
	
	public ArrayList<StudentVO> getAllList(){
		return list;
	}
	
	public void addStudent(StudentVO st) {
		list.add(st);
		System.out.println("가입완료 =" + st.toString());
	}
	
	public StudentVO removeStudent(int index) {
		StudentVO delSt = list.get(index);
		list.remove(index);
		return delSt;
	}
	
	public int checkId(String id) {
		int check = -1;
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getId().equals(id)) {
				check = i;
				break;
			}
		}
		return check;
	}
	
	public void printStudent() {
		for(int i=0; i<list.size(); i++) {
			list.get(i).printData();
		}
	}
	
	public void sortData() {
		for(int i=0; i<list.size(); i++) {
			int maxScore = list.get(i).getScore();
			int maxIdx = i;
			for(int j=i; j<list.size(); j++) {
				if(maxScore < list.get(j).getScore()) {
					maxScore = list.get(j).getScore();
					maxIdx = j;
				}
			}
			
			StudentVO temp = list.get(i);
			list.set(i, list.get(maxIdx));
			list.set(maxIdx, temp);
		}
	}
	
	public int getSize() {
		return list.size();
	}
}