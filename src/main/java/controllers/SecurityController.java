package controllers;


import model.UserForm;

import model.UserLogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;

@Controller
public class SecurityController {


    @Autowired
    private UserService userService;


//    @InitBinder("userForm")
//    protected void initUserFormBinder(WebDataBinder binder) {
//        binder.setValidator(new UserFormValidator());
//    }
//
//    @InitBinder("userLogin")
//    protected void initUserLoginBinder(WebDataBinder binder) {
//        binder.setValidator(new UserLoginValidator());
//    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String newUser(ModelMap map) {
        map.addAttribute("user", new UserForm());
        map.addAttribute("loginForm", new UserLogin());
        map.addAttribute("modal_visible",false);
        return "index";
    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String springHandler(
            RedirectAttributes redirectAttributes,
            @Validated @ModelAttribute("user") UserForm userForm,
            BindingResult result,
            ModelMap map
    ) {
        if (result.hasErrors()) {
            return "index";
        } else {
            // map.addAttribute("modal_visible",false);
            userService.registerUser(userForm);
            redirectAttributes.addFlashAttribute("message", "Пользователь успешно зарегистрирован.");
            return "redirect:" + MvcUriComponentsBuilder.fromMappingName("SC#newUser").build();
        }

    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap map, @RequestParam(required = false) String error, @ModelAttribute("loginForm") UserLogin userLogin, BindingResult result) {
        map.put("error", error);
        map.addAttribute("user", new UserForm());
        map.addAttribute("modal_visible",false);
        return "index";
    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping(value = "/loginerror", method = RequestMethod.GET)
    public String loginError(ModelMap map, @RequestParam(required = false) String error, @ModelAttribute("loginForm") UserLogin userLogin, BindingResult result) {
        map.put("error", "К сожалению, такой пользователь не найден");
        return "index";
    }

    @RequestMapping(value = "/loginerror", method = RequestMethod.POST)
    public String springHandlerLogin(
            RedirectAttributes redirectAttributes,
            @Validated @ModelAttribute("loginForm") UserLogin userLogin,
            BindingResult result,
            ModelMap map
    ) {
        map.addAttribute("user", new UserForm());
        map.addAttribute("modal_visible",false);
        if (result.hasErrors()) {

           return "index";

        } else {
            return "redirect:" + MvcUriComponentsBuilder.fromMappingName("PC#newPost").build();
        }

    }

}
