class Solution {
    public int[][] kClosest(int[][] points, int k) {
        PriorityQueue<int[]> pq = new PriorityQueue<>
            ((a,b) -> ((b[0] * b[0] + b[1] * b[1]) - (a[0] * a[0] + a[1] * a[1])));
        
        for (int[] point : points) {
            pq.add(point);
            if (pq.size() > k) pq.remove();
        }
        
        int[][] result = new int[k][2];
        while (k-- > 0) result[k] = pq.remove();
        return result;
    }
}