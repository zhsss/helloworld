package suanfajava;

public class findunion {
	
    private int [] id;
	
	public void QuickFindUF(int N) {
		id=new int[N];
		for(int i=0;i<N;i++) {
			id[i]=i;
		}
	}
	//find union 最多三层，减少层数
	public int root(int i) {
		while(i!=id[i]) {
			id[i]=id[id[i]];
			i=id[i];
		}
		return i;
		
	}
	public boolean connected(int p,int q) {
		return id[p]==id[q];
		
	}
	
	
	public void union(int p,int q) {
		int pid=root(p);
		int qid=root(q);
		id[pid]=qid;
		
	}
}
