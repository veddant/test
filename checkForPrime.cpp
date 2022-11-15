// #include <bits/stdc++.h>
// using namespace std;

// bool isPrime(int n)
// {
//     if (n == 1)
//         // cout << "n is not prime nor composite" << endl;
//         return false;
//     if (n == 2 || n == 3)
//         // cout << "n is 2 or 3 --> is prime no." << endl;
//         return true;
//     if (n % 2 == 0 || n % 3 == 0)
//         // cout << "not a prime" << endl;
//         return false;
//     for (int i = 5; i < sqrt(n); i += 6)
//     {
//         if (n % i == 0 || n % (i + 2) == 0)
//             // cout << "not a prime" << endl;
//             return false;
//     }
//     // cout << "is a prime" << endl;
//     return true;
// }

// int main()
// {
//     int a;
//     cin >> a;
//     cout << (isPrime(a) ? "true" : "false");
//     return 0;
// }

#include <bits/stdc++.h>
using namespace std;

bool isPrime(int n)
{
    if (n == 1)
        return false;
    if (n == 2 || n == 3)
        return true;
    if (n % 2 == 0 || n % 3 == 0)
        return false;
    for (int i = 5; i < sqrt(n); i += 6)
    {
        if (n % i == 0 || n % (i + 2) == 0)
            return false;
    }
    return true;
}
int main()
{
    int a;
    cout << "enter a no. to check if it's a prime no." << endl;
    cin >> a;
    cout << (isPrime(a) ? "true" : "false");
}