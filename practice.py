
class Solution:
    def outerTrees(self, trees):
        d = {}
        for i in range(100):
            maximum = 0
            minimum = 101
            for j in trees:
                if j[0] == i:
                    if j[1] < minimum:
                        minimum = j[1]
                    if j[1] > maximum:
                        maximum = j[1]
            if maximum != 0 and minimum != 101:
                d[str(i)] = [maximum,minimum]
        on_fence = []
        x_rightest = 0
        y_top = 0
        x_leftest = 100
        y_bottom = 100
        for k,v in d.items():
            y_top = max(y_top,v[0],v[1])
            y_bottom = min(y_bottom,v[0],v[1])
            x_rightest = max(x_rightest,int(k))
            x_leftest = min(x_leftest,int(k))
            if v[0] == v[1]:
                on_fence += [[k,v[0]]]
            else:
                on_fence += [[k,v[0]],[k,v[1]]]
                
        print(y_top,y_bottom,x_rightest,x_leftest)
        starting_point = [x_leftest,min(d[str(x_leftest)])]
        fencers =[starting_point]
        for i in trees:
            if i[0] == x_leftest and d[str(x_leftest)][1] < i[1]:
                fencers.append(i)
            if i[0] == x_rightest and d[str(x_rightest)][1] < i[1]:
                fencers.append(i)
            if i[1] == y_top and str(i[0]) in d:
                fencers.append(i)
            if i[1] == y_bottom and str(i[0]) in d:
                fencers.append(i)
        
        
        
        while starting_point[1] != y_bottom:
            for k in d:
                if int(k) > starting_point[0] and d[k][1] < starting_point[1]:
                    starting_point = [int(k),d[k][1]]
                    fencers += [starting_point]
                    
        


        while starting_point[0] != x_rightest:
            for k in d:
                if int(k) == x_rightest:
                    starting_point = [int(k),d[k][1]]
                    fencers += [starting_point]
                    break
                if int(k) > starting_point[0] and d[k][1] > starting_point[1] and d[k][1] <= d[str(x_rightest)][1]:
                    starting_point = [int(k),d[k][1]]
                    fencers += [starting_point]
        starting_point = [x_leftest,min(d[str(x_leftest)])]

        while starting_point[1] != y_top:
            for k in d:
                if int(k) > starting_point[0] and d[k][0] > starting_point[1]:
                    starting_point = [int(k),d[k][0]]
                    fencers += [starting_point]   
        while starting_point[0] != x_rightest:
            for k in d:
                if int(k) == x_rightest:
                    starting_point = [int(k),d[k][1]]
                    fencers += [starting_point]
                    break
                if int(k) > starting_point[0] and d[k][0] < starting_point[1] and d[k][0] >= d[str(x_rightest)][0]:
                    starting_point = [int(k),d[k][0]]
                    fencers += [starting_point]
        output = []
        for i in fencers:
            if i not in output:
                output.append(i)  
        
        return output

s = Solution()
print(s.outerTrees([[0,2],[1,1],[2,2],[2,4],[4,2],[3,3]]))

