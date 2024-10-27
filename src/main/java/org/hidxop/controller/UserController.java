package org.hidxop.controller;

import org.hidxop.entity.User;
import org.hidxop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public ModelAndView listUsers() {
        ModelAndView mv = new ModelAndView("user/list");
        mv.addObject("users", userService.getAllUsers());
        return mv;
    }

    @GetMapping("/add")
    public ModelAndView showAddForm() {
        ModelAndView mv = new ModelAndView("user/create");
        return mv;
    }

    @PostMapping("/add")
    public ModelAndView handleAddUser(@ModelAttribute User user,
                                      RedirectAttributes redirectAttributes) {
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("message", "User added successfully");
        return new ModelAndView("redirect:/users");
    }

    @GetMapping("/edit/{id}")
    public ModelAndView showEditForm(@PathVariable("id") Long id) {
        User user = userService.getUserById(id);
        if (user == null) {
            ModelAndView errorMv = new ModelAndView("error");
            errorMv.addObject("error", "User not found");
            return errorMv;
        }
        ModelAndView mv = new ModelAndView("user/edit");  // Changed from form to edit
        mv.addObject("user", user);
        return mv;
    }

    @PostMapping("/edit/{id}")
    public ModelAndView handleEditUser(@PathVariable Long id,
                                       @ModelAttribute User user,
                                       RedirectAttributes redirectAttributes) {
        user.setId(id);
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("message", "User updated successfully");
        return new ModelAndView("redirect:/users");
    }

    @GetMapping("/delete/{id}")
    public ModelAndView handleDeleteUser(@PathVariable("id") Long id,
                                         RedirectAttributes redirectAttributes) {
        try {
            userService.deleteUser(id);
            redirectAttributes.addFlashAttribute("message", "User deleted successfully");
            return new ModelAndView("redirect:/users");
        } catch (Exception e) {
            ModelAndView mv = new ModelAndView("error");
            mv.addObject("error", "Error deleting user: " + e.getMessage());
            return mv;
        }
    }


}