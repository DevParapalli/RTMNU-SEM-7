from collections import deque
class Solution:
    def maxProbability(self, n: int, edges: list[list[int]], succProb: list[float], start_node: int, end_node: int) -> float:
        graph = {}
        for i in range(len(edges)):
            if edges[i][0] not in graph:
                graph[edges[i][0]] = []
            if edges[i][1] not in graph:
                graph[edges[i][1]] = []
            graph[edges[i][0]].append((edges[i][1], succProb[i]))
            graph[edges[i][1]].append((edges[i][0], succProb[i]))
        prob = [0] * n
        prob[start_node] = 1
        queue = deque([start_node])
        while queue:
            node = queue.popleft()
            try:
                for next_node, next_prob in graph[node]:
                    if prob[node] * next_prob > prob[next_node]:
                        prob[next_node] = prob[node] * next_prob
                        queue.append(next_node)
            except KeyError:
                return 0
        return prob[end_node]
        

print(Solution().maxProbability(
    500, 
    [[193,229],[133,212],[224,465]],
    [0.91,0.78,0.64],
    4,
    364
))