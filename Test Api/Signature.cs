using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

    using System.Security.Cryptography;
    using Org.BouncyCastle.OpenSsl;
    using Org.BouncyCastle.Crypto;
    using Org.BouncyCastle.Security;
    using Org.BouncyCastle.Crypto.Parameters;
using System.IO;

namespace Test_Api
{


   static class Signature
    {

        public static string signature()
        {
            const string PubKeyFile = @"D:\Projects\privatekey.pem";
            const string keyName = "1160161767721KE2019-09-16";
            CspParameters cspp = new CspParameters();
            RSAParameters RSAKeyInfo = new RSAParameters();
            string returnValue = null;
            Org.BouncyCastle.Utilities.IO.Pem.PemObject po = null;
            using (StreamReader sr = new StreamReader(PubKeyFile))
            {
                Org.BouncyCastle.OpenSsl.PemReader pr = new Org.BouncyCastle.OpenSsl.PemReader(sr);
                po = pr.ReadPemObject();
            }

            RSAKeyInfo.Modulus = po.Content;
            cspp.KeyContainerName = keyName;
            try
            {
                //Create a new instance of RSACryptoServiceProvider. 
                using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(cspp))
                {
                    rsa.PersistKeyInCsp = true;
                    rsa.ImportParameters(RSAKeyInfo);
                    //The hash to sign. 
                    byte[] hash;
                    using (SHA256 sha256 = SHA256.Create())
                    {
                        byte[] data = new byte[] { 59, 4, 248, 102, 77, 97, 142, 201, 210, 12, 224, 93, 25, 41, 100, 197, 213, 134, 130, 135 };
                        hash = sha256.ComputeHash(data);
                    }


                    //Create an RSASignatureFormatter object and pass it the  
                    //RSACryptoServiceProvider to transfer the key information.
                    RSAPKCS1SignatureFormatter RSAFormatter = new RSAPKCS1SignatureFormatter(rsa);

                    //Set the hash algorithm to SHA256.
                    RSAFormatter.SetHashAlgorithm("SHA256");

                    //Create a signature for HashValue and return it. 
                    byte[] SignedHash = RSAFormatter.CreateSignature(hash);


                    returnValue = System.Convert.ToBase64String(SignedHash);


                }

            }
            catch (CryptographicException e)
            {
                Console.WriteLine(e.Message);
            }
            return returnValue;
        }
    }


}
