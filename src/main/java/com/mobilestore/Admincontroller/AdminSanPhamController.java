package com.mobilestore.Admincontroller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobilestore.model.CauHinh;
import com.mobilestore.model.HangSanXuat;
import com.mobilestore.model.KhachHang;
import com.mobilestore.model.LoaiSanPham;
import com.mobilestore.model.SanPham;
import com.mobilestore.service.CauHinhService;
import com.mobilestore.service.HangSXService;
import com.mobilestore.service.LoaiSPService;
import com.mobilestore.service.SanPhamService;
import com.mobilestore.service.SessionService;

@Controller
@RequestMapping("/admin")
public class AdminSanPhamController {
	@Autowired
	SessionService sessionService;
	
	@Autowired
	SanPhamService spService;

	@Autowired
	LoaiSPService lspService;

	@Autowired
	HangSXService hsxService;
	
	@Autowired
	CauHinhService chService;
	

	
	@RequestMapping("/sanpham")
	public String sanPham_index(Model model, @RequestParam("p") Optional<Integer> p,
			@ModelAttribute("sanpham") SanPham sanPham) {
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<SanPham> listSP = spService.findAll(pageable);
		List<LoaiSanPham> listLoaiSP = lspService.findAll();
		List<HangSanXuat> listHangSX = hsxService.findAll();
		List<CauHinh> listCauHinh = chService.findAll();
		
		model.addAttribute("listLoaiSP", listLoaiSP);
		model.addAttribute("listCH", listCauHinh);
		model.addAttribute("listHangSX", listHangSX);
		model.addAttribute("listsp", listSP);
		return "admin/sanpham";
	}

	@RequestMapping("/sanpham/create")
	public String sanPham_create(Model model, @Valid @ModelAttribute("sanpham") SanPham sp, BindingResult bindingResult,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageAble = PageRequest.of(p.orElse(0), 5);
		Page<SanPham> listSP = spService.findAll(pageAble);
		List<LoaiSanPham> listLoaiSP = lspService.findAll();
		List<HangSanXuat> listHangSX = hsxService.findAll();
		List<CauHinh> listCauHinh = chService.findAll();
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("listLoaiSP", listLoaiSP);
			model.addAttribute("listHangSX", listHangSX);
			model.addAttribute("listCH", listCauHinh);
			model.addAttribute("listsp", listSP);
			return "admin/sanpham";
		} else {
			spService.save(sp);
			model.addAttribute("message", "Th??m m???i th??nh c??ng");
			return "redirect:/admin/sanpham";
		}
	}

	@RequestMapping("/sanpham/update")
	public String sanPham_update(Model model, @Valid @ModelAttribute("sanpham") SanPham sp, BindingResult bindingResult,
			@RequestParam("p") Optional<Integer> p) {

		Pageable pageAble = PageRequest.of(p.orElse(0), 5);
		Page<SanPham> listSP = spService.findAll(pageAble);
		List<LoaiSanPham> listLoaiSP = lspService.findAll();
		List<HangSanXuat> listHangSX = hsxService.findAll();
		List<CauHinh> listCauHinh = chService.findAll();

		if (!spService.existsById(sp.getMaSP())) {
			model.addAttribute("message", "Lo???i s???n ph???m kh??ng t???n t???i");
			model.addAttribute("listLoaiSP", listLoaiSP);
			model.addAttribute("listHangSX", listHangSX);
			model.addAttribute("listCH", listCauHinh);
			model.addAttribute("listsp", listSP);
			return "admin/sanpham";
		} else if (bindingResult.hasErrors()) {
			model.addAttribute("listLoaiSP", listLoaiSP);
			model.addAttribute("listHangSX", listHangSX);
			model.addAttribute("listCH", listCauHinh);
			model.addAttribute("listsp", listSP);
			model.addAttribute("sanpham", sp);
			return "admin/sanpham";
		} else {
			spService.save(sp);
			model.addAttribute("message", "C???p nh???t th??nh c??ng");
			return "redirect:/admin/sanpham/edit/" + sp.getMaSP();
		}
	}

	@RequestMapping("/sanpham/edit/{masp}")
	public String sanPham_edit(Model model, @PathVariable("masp") Integer maSP,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageAble = PageRequest.of(p.orElse(0), 5);
		Page<SanPham> listSP = spService.findAll(pageAble);
		List<LoaiSanPham> listLoaiSP = lspService.findAll();
		List<HangSanXuat> listHangSX = hsxService.findAll();
		List<CauHinh> listCauHinh = chService.findAll();
		
		SanPham sp = spService.findById(maSP);

		model.addAttribute("listLoaiSP", listLoaiSP);
		model.addAttribute("listCH", listCauHinh);
		model.addAttribute("listHangSX", listHangSX);
		model.addAttribute("listsp", listSP);
		model.addAttribute("sanpham", sp);
		return "admin/sanpham";
	}

	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/sanpham/delete/{maSP}")
	public String sanPham_delete(Model model, @ModelAttribute("sanpham") SanPham sp,
			@PathVariable("maSP") Integer maSP, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0),5);
		Page<SanPham> listSP = spService.findAll(pageable);
		List<LoaiSanPham> listLoaiSP = lspService.findAll();
		List<HangSanXuat> listHangSX = hsxService.findAll();
		List<CauHinh> listCauHinh = chService.findAll();
		
		if(maSP.equals("null")) {
			model.addAttribute("message", "Vui l??ng ch???n m???t lo???i s???n ph???m ????? x??a");
			model.addAttribute("listLoaiSP", listLoaiSP);

			model.addAttribute("listCH", listCauHinh);
			model.addAttribute("listHangSX", listHangSX);
			model.addAttribute("listsp", listSP);			
			return "admin/sanpham";
		}else {
			SanPham sanPham = spService.findById(maSP);
			sanPham.setDaXoa(true);
			spService.update(sanPham);
			model.addAttribute("message", "X??a th??nh c??ng");	
			return "redirect:/admin/sanpham";
		}
	}
	
	@RequestMapping("/sanpham/reset")
	public String sanPham_reset() {
		return "redirect:/admin/sanpham";
	}

	@RequestMapping("/sanpham/search")
	public String sanPham_search(Model model, @RequestParam("keyword") Optional<String> kw,
			 @ModelAttribute("sanpham") SanPham sp) {
		String kwords = kw.orElse(sessionService.get("keyword",""));
		sessionService.get("keyword",kwords);
		List<SanPham> listSP = spService.findAllByKeyword("%"+kwords+"%");

		if(kwords.equals("")) {
			return "redirect:/admin/sanpham";
		}else {
			model.addAttribute("listsp", listSP);	
			model.addAttribute("deletePage", 1);	
			return "admin/sanpham";
		}
	}

}
