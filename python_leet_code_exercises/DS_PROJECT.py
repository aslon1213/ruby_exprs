from collections import defaultdict, deque
from math import ceil


class circularList:
    def __init__(self):
        pass


class Deque:
    """"""

    def __init__(self, size):
        self.values = [0] * size
        self.front = -1
        self.rear = 0
        self.size = size

    def popleft(self):
        # check whether Deque is empty or not
        if self.is_empty():
            print("Queue Underflow")
            return

        # Deque has only one element
        if self.front == self.rear:
            self.front = -1
            self.rear = -1

        else:
            # back to initial position
            if self.front == self.size - 1:
                self.front = 0

            else:  # increment front by '1' to remove current
                # front value from Deque
                self.front = self.front + 1

    def append(self, key):
        if self.is_empty():
            print(" Overflow")
            return

        # If queue is initially empty
        if self.front == -1:
            self.front = 0
            self.rear = 0

        # rear is at last position of queue
        elif self.rear == self.size - 1:
            self.rear = 0

        # increment rear end by '1'
        else:
            self.rear = self.rear + 1

        # insert current element into Deque
        self.values[self.rear] = key

    # Inserts an element at front
    def insert_front(self, key):

        # check whether Deque if  full or not
        if self.is_empty():
            print("Overflow")
            return

        # If queue is initially empty
        if self.front == -1:
            self.front = 0
            self.rear = 0

        # front is at first position of queue
        elif self.front == 0:
            self.front = self.size - 1

        else:  # decrement front end by '1'
            self.front = self.front - 1

        # insert current element into Deque
        self.values[self.front] = key

    # function to inset element at rear end
    # of Deque.

    def insert_rear(self, key):
        if self.is_empty():
            print(" Overflow")
            return

        # If queue is initially empty
        if self.front == -1:
            self.front = 0
            self.rear = 0

        # rear is at last position of queue
        elif self.rear == self.size - 1:
            self.rear = 0

        # increment rear end by '1'
        else:
            self.rear = self.rear + 1

        # insert current element into Deque
        self.values[self.rear] = key

    # Deletes element at front end of Deque

    def delete_front(self):
        # check whether Deque is empty or not
        if self.is_empty():
            print("Queue Underflow")
            return

        # Deque has only one element
        if self.front == self.rear:
            self.front = -1
            self.rear = -1

        else:
            # back to initial position
            if self.front == self.size - 1:
                self.front = 0

            else:  # increment front by '1' to remove current
                # front value from Deque
                self.front = self.front + 1

    # Delete element at rear end of Deque

    def delete_rear(self):
        if self.is_empty():
            print(" Underflow")
            return

        # Deque has only one element
        if self.front == self.rear:
            self.front = -1
            self.rear = -1

        elif self.rear == 0:
            self.rear = self.size - 1
        else:
            self.rear = self.rear - 1

    def get_front(self):
        pass

    def get_rear(self):
        pass

    def is_full(self):
        return (
            self.front == 0 and self.rear == self.size - 1
        ) or self.front == self.rear + 1

    # Checks whether Deque is empty or not.

    def is_empty(self):
        return self.front == -1


class hello:
    pass


class graphOfCities:
    """Grapf of cities using adjacency matrix"""

    number = 0

    def __init__(self):
        """Constructor"""
        self.matrix = []
        self.cities = {}

    def is_empty(self):
        """"""
        if len(self.matrix) == 0:
            return True
        else:
            return False

    def path_exists(self, city_from, city_to):
        # if city has no neigbor then return False otherwise return True
        if (
            sum(self.matrix[city_from.number]) == 0
            or sum(self.matrix[city_to.number]) == 0
        ):
            return False
        else:
            return self.BFS(city_from, city_to)

    def BFS(self, city_from, city_to):
        queue = []  # queue
        cities_ = list(self.cities.values())  # City objects
        status_list = [1 for i in range(len(self.matrix))]  # status of cities
        # 1 - unvisited
        # 2 - visting
        # 3 - visited
        queue.append(city_from.number)
        status_list[city_from.number] = 2
        traversal = []  # traversal of grapf by BFS
        predecessors = {}  # to keep track of predecessors of cities while traversing
        while queue:
            s = queue.pop(0)
            traversal.append(s)
            status_list[s] = 3
            for c in cities_[s][1].neighbours:
                if status_list[c.number] == 1:
                    queue.append(c.number)
                    predecessors[c.number] = s
                    status_list[c.number] = 2

        # getting the easiest track of city_from to city_to
        output = []
        a = city_to.number
        b = predecessors[a]
        output.append(a)
        while b != city_from.number:
            a = predecessors[a]
            b = predecessors[a]
            output.append(a)
        output.append(city_from.number)
        return output

    def DFS(self, args):
        pass

    def exists(self, city):
        """To check whether city(node) exists in the graph"""
        cities = []
        # add City objects from self.cities hastable to cities array
        for k in self.cities.values():
            cities.append(k[1])

        # iterate through the cities array until its found
        if city in cities:
            return True
        else:
            return False

    def create_city(self, city_name):
        """add city to graph - no connection/neighbors
        just a city separated"""
        a = City(city_name, self.number)
        self.number += 1
        for i in self.matrix:
            i.append(0)
        self.matrix.append([0 for i in range(self.number)])
        self.cities[a.name] = [self.number, a]
        return a

    def get_routes_by_numbers(self):
        cities = self.cities.values()  # City objects array
        output = []  # array to be returned
        matrixes = self.matrix  # adjacency matrix of graph
        length = len(matrixes)
        for i in range(length):
            for j in range(length):
                if matrixes[i][j] == 1:  # if cities are neigbors
                    a = [i, j]  # contruct array representing of their numbers
                    b = [j, i]  # meaning that they are neigbors
                    if a not in output and b not in output:
                        output.append(a)  # add that array to output

        print(output)
        return output

    def add_city_neighbors(self, city_1, city_2, distance):
        """make two cities(city_1 and city_2) neighbors"""
        self.matrix[city_1.number][
            city_2.number
        ] = 1  # set ith row jth column of matrix to 1 as city_1 has neighbor city_2
        self.matrix[city_2.number][
            city_1.number
        ] = 1  # set jth row ith column of matrix to 1 as city_2 has neighbor city_1
        city_1.add_city_neighbor(city_2, distance)

    def __str__(self):

        """string converter function"""
        output = "        "
        cities_ = list(self.cities.keys())
        for c in cities_:
            output += c + " "
        output += "\n"
        n = 0

        for i in self.matrix:
            k = "" + cities_[n] + "         "
            n += 1
            for j in i:
                k += str(j) + " "
            k += "\n"
            output += k
        return output


class City:
    def __init__(self, name, number):
        self.neighbours = []  # neighbors of this city
        self.distances = []  # distances from the this city to its neighbors
        self.name = name  # name of the city - String
        self.number = number  # number of the city is the graph

    def add_city_neighbor(self, ng, distance):
        """Add city to neighbors list(array)"""
        if isinstance(ng, City):
            self.neighbours.append(ng)
            self.distances.append(distance)
            ng.neighbours.append(self)
            ng.distances.append(distance)

    @staticmethod
    def construct_path():
        """contruct path from this city to city given
        using DFS or BFS
        """
        pass

    def __str__(self):
        print("City " + self.name)
        print("City Number  " + str(self.number))
        print("Neighbours ")
        cities = ""
        for i in range(len(self.neighbours)):
            cities += (
                f"{self.neighbours[i].name} is in distance {self.distances[i]}" + "\n"
            )
        return cities


# a = City("Tashkent")
# b= City("Bukhara")
# c = City("Andijon")
# d = City("Urganch")
def minimumFuelCost(roads, seats):
    graph = defaultdict(list)
    in_degree = defaultdict(int)
    cnt = defaultdict(int)

    for i, j in roads:
        graph[i].append(j)
        graph[j].append(i)
        in_degree[i] += 1
        in_degree[j] += 1

    deq = Deque(100)
    deq = deque()
    for i in range(1, len(roads) + 1):
        if in_degree[i] == 1:
            deq.append(i)
            cnt[i] += 1
    ans = 0
    while deq:
        node = deq.popleft()
        ans += int(ceil(cnt[node] / seats))
        for i in graph[node]:
            in_degree[i] -= 1
            cnt[i] += cnt[node]
            if in_degree[i] == 1:
                if i != 0:
                    cnt[i] += 1
                    deq.append(i)
    return ans


# create cities and graph
a = graphOfCities()
b = a.create_city("Tashkent")
h = a.create_city("Namangan")
d = a.create_city("Andijan")
e = a.create_city("Fargona")
c = a.create_city("Bukhara")
g = a.create_city("Qarshi")
f = a.create_city("Xorazm")
r = a.create_city("XXXXXX")
t = a.create_city("YYYYYYY")
u = a.create_city("X")


# create connection beetween cities
a.add_city_neighbors(b, c, 100)
a.add_city_neighbors(b, h, 80)
a.add_city_neighbors(h, e, 50)
a.add_city_neighbors(e, d, 20)
a.add_city_neighbors(c, f, 80)
a.add_city_neighbors(b, g, 100)

a.add_city_neighbors(e, r, 200)
a.add_city_neighbors(r, t, 100)
a.add_city_neighbors(t, u, 100)


# print
# print(b)
# print(c)
# print(d)
# print(a)
# print(a.exists(b))
# y = a.get_routes_by_numbers()
# print(minimumFuelCost(roads=y, seats=5))
print(a.BFS(b, f))
