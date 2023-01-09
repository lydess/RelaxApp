import Foundation
import Realm
import RealmSwift
import AVKit

class DataBaseHandler {
    var db:Realm? = nil

    public var player = AVAudioPlayer()
    func InitalDBSetup() {
        var config = Realm.Configuration()
        config.schemaVersion = 2

        Realm.Configuration.defaultConfiguration = config
        db = try! Realm()
    }
    func testadd() {
        guard let UDB = db else {print("error DBnil"); return}
        let newtrack = Track(name: "yo")
        do {
          try  UDB.write({UDB.add(newtrack)})
        } catch {
            print("failed to write")
        }
    }

    func testread() {
        guard let UDB = db else {print("error DBnil"); return}
        print(UDB.objects(Track.self))
    }

    func findpath() {
        print(URL.temporaryDirectory)

    }
    func testFullSoundTest() throws {
        var filedata = Data()
        var decoded = Data()
        guard let fileurl = Bundle.main.url(
            forResource: "White",
          withExtension: ".mp3") ?? URL(string: "") else { return  }
        let Encoder = JSONEncoder()
        let Decoder = JSONDecoder()

        do {
            filedata = try Encoder.encode(Data.init(contentsOf: fileurl))
        } catch {
            print("encoding fail")
            return
        }

        do {
            decoded = try Decoder.decode(Data.self, from: filedata)
            print(decoded)
        } catch {
            print("Decoding fail")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(data: decoded, fileTypeHint: ".mp3")
            player.play()
        } catch {
            print("audioplay fail")
        }
    }

    func cleardb() {
        guard let UDB = db else {print("error DBnil"); return}
        var tracks = UDB.objects(Track.self)
        do {
            try UDB.write({
                for x in tracks {
                    UDB.delete(x)
                }
            })
        } catch {
            print("clearDB failure")
        }
        }


}

class Track: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name:String = ""
    @Persisted var data:Data? = Data()

    convenience init(name:String, data:Data? = nil) {
        self.init()
        self.name = name
        self.data = data
    }
}

