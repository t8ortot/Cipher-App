import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "A-Ceasar": AlphanumericCeaserCipher(),
        "Rail-fence": RailFenceCipher(),
        "Morse": MorseCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
