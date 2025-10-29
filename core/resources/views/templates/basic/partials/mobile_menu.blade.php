<div id="menu">
    <ul>
        <li>
            <a href="{{ route('mobile-user.dashboard') }}" class="d-flex flex-column align-items-center">
                <img src="{{  asset('assets/mobile-user/img/menu/home' . ( in_array($currentRoute, ['mobile-user.dashboard', 'home']) ? '-a' : '') . '.png') }}"
                    alt="Home Image" />
                <span>Home</span>
            </a>
        </li>
        <li>
            <a href="{{ route('mobile-user.crypto') }}" class="d-flex flex-column align-items-center">
                <img src="{{  asset('assets/mobile-user/img/menu/trade' . ($currentRoute == 'mobile-user.crypto' ? '-a' : '') . '.png') }}"
                    alt="Trade Image" />
                <span>Trade</span>
            </a>
        </li>
        <li>
            <a href="{{ route('mobile-user.chart') }}"
                class="d-flex flex-column align-items-center {{ $currentRoute == 'mobile-user.chart' ? 'text-info' : '' }}">
                <img src="{{  asset('assets/mobile-user/img/menu/option.png') }}" alt="Option Image" />
                <span>Option</span>
            </a>
        </li>
        <li>
            <a href="{{ route('mobile-user.trust') }}" class="d-flex flex-column align-items-center">
                <img src="{{  asset('assets/mobile-user/img/menu/trust' . ($currentRoute == 'mobile-user.trust' ? '-a' : '') . '.png') }}"
                    alt="Trust Image" />
                <span>Trust</span>
            </a>
        </li>
        <li>
            <a href="{{ route('mobile-user.assets') }}" class="d-flex flex-column align-items-center">
                <img src="{{  asset('assets/mobile-user/img/menu/assets' . ($currentRoute == 'mobile-user.assets' ? '-a' : '') . '.png') }}"
                    alt="Assets Image" />
                <span>Assets</span>
            </a>
        </li>
    </ul>
</div>
<div style="height: var(--menu-height)"></div>
