// Demonstrate how to provide secure data storage, secure data transmission and for creatingdigital signatures.


import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.Signature;
import java.util.Scanner;

public class CreatingDigitalSignature {

    public static void main(String args[]) throws Exception {

        // Accepting text from user
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter some text");
        String msg = sc.nextLine();

        // Creating KeyPair generator object
        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("DSA");

        // Initializing the key pair generator
        keyPairGen.initialize(2048);

        // Generate the pair of keys
        KeyPair pair = keyPairGen.generateKeyPair();

        // Getting the private key from the key pair
        PrivateKey privKey = pair.getPrivate();

        // Creating a Signature object
        Signature sign = Signature.getInstance("SHA256withDSA");

        // Initialize the signature
        sign.initSign(privKey);

        // Converting message to bytes
        byte[] bytes = msg.getBytes();

        // Adding data to the signature
        sign.update(bytes);

        // Calculating the signature
        byte[] signature = sign.sign();

        // Printing the signature
        System.out.println(
                "Digital signature for given text: "
                + new String(signature, "UTF8")
        );

        sc.close();
    }
}


// Output
// Enter some text
// Hi how are you
// Digital signature for given text: 0=@gRD???-?.???? /yGL?i??a!?