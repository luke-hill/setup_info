scp <localfile> user@host:<destination>

i.e. Using the following command will copy the file "myfile.txt" from your local Downloads folder
to the home directory of user "admin" on the remote machine "secretbox.domain.com":

```
scp ~/Downloads/myfile.txt admin@secretbox.domain.com:~/
```
