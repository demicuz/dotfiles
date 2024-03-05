import AppKit
import Foundation
import ShellOut

private let kAppleInterfaceThemeChangedNotification = "AppleInterfaceThemeChangedNotification"

enum Theme {
    case light
    case dark
}

class ThemeChangeObserver {
    func observe() {
        print("Observing")

        DistributedNotificationCenter.default.addObserver(
            forName: Notification.Name(kAppleInterfaceThemeChangedNotification),
            object: nil,
            queue: nil,
            using: interfaceModeChanged(notification:)
        )
    }

    func interfaceModeChanged(notification _: Notification) {
        let themeRaw = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"

        let theme = notificationToTheme(themeRaw: themeRaw)!

        notify(theme: theme)

        respond(theme: theme)
    }
}

func notificationToTheme(themeRaw: String) -> Theme? {
    return {
        switch themeRaw {
        case "Light":
            return Theme.light
        case "Dark":
            return Theme.dark
        default:
            return nil
        }
    }()
}

func notify(theme: Theme) {
    print("\(Date()) Theme changed: \(theme)")
}

func respond(theme: Theme) {
    do {
        // Neovim ---------------------------------------------------------------
        // let output = try shellOut(to: "nvr", arguments: ["--serverlist"])
        // let servers = output.split(whereSeparator: \.isNewline)

        // if servers.isEmpty {
        //     print("\(Date()) neovim: no servers")
        // } else {
        //     servers.forEach { server in
        //         let server = String(server)

        //         print("\(Date()) neovim server (\(String(server))): sending command")

        //         let arguments = buildNvimBackgroundArguments(server: server, theme: theme)

        //         DispatchQueue.global().async {
        //             do {
        //                 try shellOut(to: "nvr", arguments: arguments)
        //             } catch {
        //                 print("\(Date()) neovim server \(String(server)): command failed")
        //             }
        //         }
        //     }
        // }

        // DispatchQueue.global().async {
        //     print("\(Date()) neovim: updating config")

        //     let arguments = [
        //         "-E",
        //         "-i",
        //         // Don't create a backfup file
        //         "''",
        //         "s/catppuccin-[a-z]*/catppuccin-\(themeToCatppuccinTheme(theme: theme))/g",
        //         "~/.config/nvim/lua/user/ui/theme.lua",
        //     ]

        //     do {
        //         try shellOut(to: "sed", arguments: arguments)
        //     } catch {
        //         print("\(Date()) neovim: config update failed")
        //     }
        // }

        // Kitty ----------------------------------------------------------------
        DispatchQueue.global().async {
            print("\(Date()) kitty: sending command")

            let arguments = buildKittyArguments(theme: theme)

            do {
                try shellOut(to: "kitty", arguments: arguments)
            } catch {
                print("\(Date()) kitty: command failed")
            }
        }

        // Bat!
        DispatchQueue.global().async {
            print("\(Date()) bat: sending command")

            let arguments = buildKittyArguments(theme: theme)

            do {
                try shellOut(
                    to: "/opt/homebew/bin/fish",
                    arguments: ["-c", "set -Ux BAT_THEME \"\(getBatTheme(theme: theme))\""]
                )
            } catch {
                print("\(Date()) kitty: command failed")
            }
        }
    } catch {
        let error = error as! ShellOutError
        print(error.message) // Prints STDERR
        print(error.output) // Prints STDOUT
    }
}

func buildNvimBackgroundArguments(server: String, theme: Theme) -> [String] {
    return ["--servername", server, "+'colorscheme catppuccin-\(themeToCatppuccinTheme(theme: theme))'"]
}

func buildKittyArguments(theme: Theme) -> [String] {
    return [
        "+kitten",
        "themes",
        "--reload-in=all",
        "--config-file-name",
        "themes.conf",
        getKittyTheme(theme: theme)
    ]
}

func getKittyTheme(theme: Theme) -> String {
    return {
        switch theme {
        case .light:
            return "Gruvbox Light Hard"
        case .dark:
            return "Gruvbox Dark Hard"
        }
    }()
}

func getBatTheme(theme: Theme) -> String {
    return {
        switch theme {
        case .light:
            return "gruvbox-light"
        case .dark:
            return "gruvbox-dark"
        }
    }()
}

func themeToCatppuccinTheme(theme: Theme) -> String {
    return {
        switch theme {
        case .light:
            return "latte"
        case .dark:
            return "mocha"
        }
    }()
}

func toSnakeCase(sentence: String) -> String {
    let lowercaseSentence = sentence.lowercased()

    return lowercaseSentence.replacingOccurrences(of: " ", with: "_")
}

func toKebabCase(sentence: String) -> String {
    let lowercaseSentence = sentence.lowercased()

    return lowercaseSentence.replacingOccurrences(of: " ", with: "-")
}

let app = NSApplication.shared

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_: Notification) {
        let observer = ThemeChangeObserver()
        observer.observe()
    }
}

let delegate = AppDelegate()
app.delegate = delegate
app.run()
