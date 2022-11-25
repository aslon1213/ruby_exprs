friends = [
    {"name": "Sam", "gender": "male", "sport": "Basketball"},
    {"name": "Emily", "gender": "female", "sport": "Volleyball"},
]


def select(*args):
    return (select, args)


def field_filter(*args):
    return (field_filter, args)


def query(dataset, *args):
    def select(data, *args):
        output = []
        for j in range(len(data)):
            d = {}
            for i in args[0]:
                d[i] = data[j][i]
            output.append(d)
        return output

    def field_filter(data, *args):
        output = []
        a = args[0]
        val = a[0]
        for d in range(len(data)):
            if data[d][val] in a[1]:
                output.append(data[d])
        return output

    output = dataset
    for n in args:
        statements = n[1]
        function = n[0].__name__
        if function == "select":
            output = select(output, statements)
        elif function == "field_filter":
            output = field_filter(output, statements)
    return output


results = query(
    friends,
    select("name", "gender", "sport"),
    field_filter("name", "Emily", "John"),
    field_filter("sport", "volleyball", "Basketball"),
)
print(results)


# if __name__ == "main":
#     results = query(
#         friends,
#         select("gender", "sport"),
#         field_filter("gender", "female"),
#         field_filter("sport", "volleyball", "Basketball"),
#     )
