
class AAA
{
public static void main (String[] args)
    {

    int count = 1;
    while ( count <= 15)
    {
        System.out.println(count % 2 == 0 ? "***" : "####");
        ++count;
    }
}
}