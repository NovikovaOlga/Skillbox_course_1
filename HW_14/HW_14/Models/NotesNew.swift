import RealmSwift

class NotesNew: Object {
    @objc dynamic var name = "" // наименование задачи
    @objc dynamic var done = false // статус выполнения
}
